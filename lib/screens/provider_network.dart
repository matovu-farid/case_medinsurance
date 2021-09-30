import 'package:case_app/classes/cityProvider.dart';
import 'package:case_app/classes/converter.dart';
import 'package:case_app/classes/my_marker.dart';
import 'package:case_app/widgets/city_search.dart';
import 'package:case_app/widgets/my_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProviderNetwork extends StatefulWidget {
  ProviderNetwork({Key? key}) : super(key: key);

  @override
  _ProviderNetworkState createState() => _ProviderNetworkState();
}

class _ProviderNetworkState extends State<ProviderNetwork> {
  var firestore = FirebaseFirestore.instance;

  var cityProviders = CityProviders();
  @override
  void initState() {
    super.initState();
    cityProviders.setCurrentToDefault();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider Network'),
        ),
        body: StreamBuilder<Set<Marker>>(
            stream: cityProviders.getMarkers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var markers = snapshot.data!;
                cityProviders.addToCities(markers);
                

                return Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CitySearch(
                          // value: cityProviders.currentCity,
                          defaultCity: cityProviders.defaultCity(),
                          onChanged: (val) {
                            if (val != null)
                              cityProviders.setcurrentCity(
                                  ToPosition(val.position).convert());
                          },
                          markers: markers.toList(), label: 'Search City',
                        ),
                      ),
                    ),
                    Flexible(
                      child: StreamBuilder<Set<MyMarker>>(
                          stream: cityProviders.nearbyHospitalsStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var hospitals = snapshot.data;
                              var infoMap = ToInfoMap(hospitals).convert();

                              return ListView.builder(
                                  itemCount: infoMap.length,
                                  itemBuilder: (_, index) {
                                    return Card(
                                      child: ListTile(
                                        title: Text(
                                            '${infoMap.keys.elementAt(index)}'),
                                        subtitle: Text(
                                            '${infoMap.keys.elementAt(index)}'),
                                      ),
                                    );
                                  });
                            }
                            return SizedBox(
                                height: 50,
                                width: 50,
                                child: MyIndicator(Indicator.circleStrokeSpin));
                          }),
                    )
                  ],
                );
              }
              return Container(
                  child: Center(child: MyIndicator(Indicator.ballPulseRise)));
            }),
      ),
    );
  }
}
