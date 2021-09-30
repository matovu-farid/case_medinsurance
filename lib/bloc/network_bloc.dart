import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebasefunctions/firebasefunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import '../location.dart';

abstract class NetworkBloc  {
  final geo = Geoflutterfire();

  late CollectionReference ref;

  setMarkers();

  Stream<Set<Marker>> getMarkers();

  @protected
  Set<Marker> docsToMarker(List<DocumentSnapshot<Map<String,dynamic>>> documents);
}

class Locator {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Geolocator.getCurrentPosition();
  }
}

class RadiusHandler {
  var radius = BehaviorSubject.seeded(5.0);

  void addToRadius(double rad) {
    radius.add(rad);
  }

  double get radiusValue => radius.value;
}

class ProviderNetworkBloc extends NetworkBloc {
  late RadiusHandler radiusHandler;
  final Position? centerPosition;
  ProviderNetworkBloc(this.centerPosition) {
    radiusHandler = RadiusHandler();

    ref = FirebaseFirestore.instance.collection('health_providers');
  }

  static final _logger = Logger('Provider Network');

  GeoFirePoint get center => geo.point(
      latitude: centerPosition!.latitude, longitude: centerPosition!.longitude);

  Future<void> setMarkers() async {
    var jsonString = await rootBundle.loadString('assets/json/case_app.json');
    var json = jsonDecode(jsonString);
    _logger.info(json);

    var locations = Location.fromJson(json).features!;

    return locations.forEach((location) {
      var point = geo.point(
          latitude: location.coordinates![1],
          longitude: location.coordinates![0]);
      ref.add({'position': point.data, 'name': location.properties!.name});
    });
  }

  Stream<Set<Marker>> getMarkers() {
    return radiusHandler.radius
        .switchMap((rad) => geo.collection(collectionRef: ref).within(
            center: center, radius: rad, field: 'position', strictMode: true))
        .map(docsToMarker);
  }

  Set<Marker> docsToMarker(List<DocumentSnapshot<Map<String,dynamic>>> documents) {
    return documents.map((doc) {
      
      GeoPoint point = doc.data()!['position']['geopoint'];
      var distance = center.distance(lat: point.latitude, lng: point.longitude);

      return Marker(
          markerId: MarkerId(doc.id),
          position: LatLng(point.latitude, point.longitude),
          infoWindow: InfoWindow(
              title: doc.data()!['name'], snippet: '$distance km from you'));
    }).toSet();
  }
}

