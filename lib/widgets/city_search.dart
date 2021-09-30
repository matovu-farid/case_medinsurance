import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'my_indicator.dart';

class CitySearch extends StatelessWidget {
  final List<Marker> markers;
  final String label;
  final Marker defaultCity;
  final void Function(Marker?)? onChanged;
  const CitySearch(
      {Key? key, required this.markers, required this.label, this.onChanged, required this.defaultCity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Marker>(
      selectedItem:defaultCity,
      loadingBuilder: (_, value) {
        return MyIndicator(Indicator.ballPulseSync);
      },
      maxHeight: MediaQuery.of(context).size.height,
      onChanged: onChanged,
      showSearchBox: true,
      mode: Mode.MENU,
      items: markers,
      label: label,
      itemAsString: (marker) => marker.infoWindow.title!,
    );
  }
}
