import 'dart:convert';

import 'package:case_app/bloc/network_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasefunctions/firebasefunctions.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import '../citiies.dart';
import 'converter.dart';
import 'my_marker.dart';

class CityProviders extends NetworkBloc {
  NearHospitalNetworkBloc hospitalBloc;
  CityProviders() {
    hospitalBloc = NearHospitalNetworkBloc();
    ref = firestore.collection('cities');
  }
  var nearbyHospitals = BehaviorSubject<Set<MyMarker>>();

  Position get currentCity => hospitalBloc.centerPosition;

  void setcurrentCity(Position city) {
    hospitalBloc.centerPosition = city;
    hospitalBloc.getMarkers().forEach((element) {
      nearbyHospitals.add(element);
    });
  }

  var cities = <Position>[];

  void addToCities(Iterable<Marker> markers) {
    for (var marker in markers) {
      cities.add(ToPosition(marker.position).convert());
    }
  }

  Stream<Set<MyMarker>> get nearbyHospitalsStream => nearbyHospitals.stream;

  @override
  Set<Marker> docToMarker(List<DocumentSnapshot> documents) {
    return documents.map((doc) {
      GeoPoint point = doc.data()['position']['geopoint'];

      return Marker(
          markerId: MarkerId(doc.id),
          position: LatLng(point.latitude, point.longitude),
          infoWindow: InfoWindow(title: doc.data()['name']));
    }).toSet();
  }

  @override
  Stream<Set<Marker>> getMarkers() {
    var ref = firestore.collection('cities');
    return geo.collection(collectionRef: ref).snapshot().map((querySnapshot) {
      var docs = querySnapshot.docs;
      return docToMarker(docs);
    });
  }

  static final _logger = Logger('City Network');

  @override
  setMarkers() async {
    var jsonString = await rootBundle.loadString('assets/json/cities.json');
    var json = jsonDecode(jsonString);
    _logger.info(json);

    var cities = City.fromJson(json).cities;

    return cities.forEach((city) {
      var point = geo.point(
          latitude: city.coordinates[1], longitude: city.coordinates[0]);
      ref.add({'position': point.data, 'name': city.name});
    });
  }
}

class NearHospitalNetworkBloc {
  Position centerPosition;
  NearHospitalNetworkBloc();

  var ref = firestore.collection('health_providers');

  static final _logger = Logger('NearHospital Network');
  final geo = Geoflutterfire();

  GeoFirePoint get center => geo.point(
      latitude: centerPosition.latitude, longitude: centerPosition.longitude);

  Stream<Set<MyMarker>> getMarkers() {
    return geo
        .collection(collectionRef: ref)
        .within(center: center, radius: 5, field: 'position', strictMode: true)
        .map(docToMarker);
  }

  Set<MyMarker> docToMarker(List<DocumentSnapshot> documents) {
    var markers = documents.map((doc) {
      GeoPoint point = doc.data()['position']['geopoint'];
      var distance = center.distance(lat: point.latitude, lng: point.longitude);

      return MyMarker(
          markerId: MarkerId(doc.id),
          position: LatLng(point.latitude, point.longitude),
          infoWindow: InfoWindow(
              title: doc.data()['name'], snippet: '$distance km from you'));
    }).toSet();
    _logger.info(markers);
    return markers;
  }
}
