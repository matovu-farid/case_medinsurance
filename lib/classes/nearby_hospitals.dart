import 'dart:convert';

import 'package:case_app/bloc/network_bloc.dart';
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
import 'nearby_hospitals.dart';

class NearHospitalNetworkBloc {
  Position? centerPosition;
  NearHospitalNetworkBloc();

  var ref = FirebaseFirestore.instance.collection('health_providers');

  static final _logger = Logger('NearHospital Network');
  final geo = Geoflutterfire();

  GeoFirePoint get center => geo.point(
      latitude: centerPosition!.latitude, longitude: centerPosition!.longitude);

  Stream<Set<MyMarker>> getMarkers() {
    return geo
        .collection(collectionRef: ref)
        .within(center: center, radius: 5, field: 'position', strictMode: true)
        .map(docToMarker);
  }

  Set<MyMarker> docToMarker(
      List<DocumentSnapshot<Map<String, dynamic>>> documents) {
    var markers = documents.map((doc) {
      GeoPoint point = doc.data()!['position']['geopoint'];
      var distance = center.distance(lat: point.latitude, lng: point.longitude);

      return MyMarker(
          markerId: MarkerId(doc.id),
          position: LatLng(point.latitude, point.longitude),
          infoWindow: InfoWindow(
              title: doc.data()!['name'], snippet: '$distance km from you'));
    }).toSet();
    _logger.info(markers);
    return markers;
  }
}
