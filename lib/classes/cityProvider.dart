import 'dart:convert';

import 'package:case_app/bloc/network_bloc.dart';
import 'package:case_app/classes/nearby_hospitals.dart';
import 'package:case_app/classes/nearby_hospitals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import '../cities.dart';
import 'converter.dart';
import 'my_marker.dart';

class CityProviders extends NetworkBloc {
  late NearHospitalNetworkBloc hospitalBloc;
  CityProviders() {
    hospitalBloc = NearHospitalNetworkBloc();
    ref = FirebaseFirestore.instance.collection('cities');
    setCurrentToDefault();
  }
  var nearbyHospitals = BehaviorSubject<Set<MyMarker>>();

  Position? get currentCity => hospitalBloc.centerPosition;
  setCurrentToDefault() {
    setcurrentCity(ToPosition(defaultCity().position)());
  }

  Marker defaultCity() {
    return Marker(
        markerId: MarkerId('default'),
        position: LatLng(0.3475964, 32.5825197),
        infoWindow: InfoWindow(title: "Kampala"));
  }

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
  Set<Marker> docsToMarker(
      List<DocumentSnapshot<Map<String, dynamic>>> documents) {
    return documents.map((doc) {
      return docToMarker(doc);
    }).toSet();
  }

  Marker docToMarker(DocumentSnapshot<Map<String, dynamic>> doc) {
    GeoPoint point = doc.data()!['position']['geopoint'];

    return Marker(
        markerId: MarkerId(doc.id),
        position: LatLng(point.latitude, point.longitude),
        infoWindow: InfoWindow(title: doc.data()!['name']));
  }

  @override
  Stream<Set<Marker>> getMarkers() {
    var ref = FirebaseFirestore.instance.collection('cities');
    return geo.collection(collectionRef: ref).snapshot().map((querySnapshot) {
      var docs = querySnapshot.docs;
      return docsToMarker(docs);
    });
  }

  static final _logger = Logger('City Network');

  @override
  setMarkers() async {
    var jsonString = await rootBundle.loadString('assets/json/cities.json');
    var json = jsonDecode(jsonString);
    _logger.info(json);

    var cities = City.fromJson(json).cities!;

    return cities.forEach((city) {
      var point = geo.point(
          latitude: city.coordinates![1], longitude: city.coordinates![0]);
      ref.add({'position': point.data, 'name': city.name});
    });
  }
}


