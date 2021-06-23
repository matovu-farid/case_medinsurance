import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class Converter<T, R> {
  final T t;
  Converter(this.t);
  R convert();
}

class ToPosition extends Converter<LatLng, Position> {
  ToPosition(LatLng latLng) : super(latLng);
  Position convert() {
    return Position(latitude: t.latitude, longitude: t.longitude);
  }
}

class ToLatLng extends Converter<Position, LatLng> {
  ToLatLng(Position t) : super(t);

  @override
  LatLng convert() {
    return LatLng(t.longitude, t.longitude);
  }
}

class ToInfo extends Converter<Marker, Map<String, String>> {
  ToInfo(Marker t) : super(t);

  @override
  Map<String, String> convert() {
    return {t.infoWindow.title: t.infoWindow.snippet};
  }
}

class ToInfoMap extends Converter<Iterable<Marker>, Map<String, String>> {
  ToInfoMap(Iterable<Marker> t) : super(t);

  @override
  Map<String, String> convert() {
    var map = <String, String>{};

    for (var marker in t) {
      var mapGot = ToInfo(marker).convert();
      if (!map.containsKey(mapGot.keys.first))
        map[mapGot.keys.first] = mapGot.values.first;
    }
    return map;
  }
}
