import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMarker extends Marker {
  MyMarker({MarkerId markerId, LatLng position, InfoWindow infoWindow})
      : super(markerId: markerId, position: position, infoWindow: infoWindow) {
    title = infoWindow.title;
    snippet = infoWindow.snippet;
  }

  String title;
  String snippet;

  factory MyMarker.fromMarker(Marker marker) {
    dynamic mymarker = marker;
    var newMarker = mymarker as MyMarker;
    newMarker.title = marker.infoWindow.title;
    newMarker.snippet = marker.infoWindow.snippet;

    return newMarker;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyMarker &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
}
