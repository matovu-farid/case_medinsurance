import 'dart:async';

import 'package:case_app/bloc/network_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logging/logging.dart';

import 'package:shared_widgets/shared_widgets.dart';


class NearMe extends StatefulWidget {
  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {

static final _logger = Logger('Provider Network');


  @override
  Widget build(BuildContext context) {
    //setCityMarkers();
    var locator = Locator();

    return Scaffold(
      
      body: Container(
        child: Center(
            child: Stack(
          children: [
            FutureBuilder<Position>(
              future: locator.getCurrentLocation(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done)
                return FireMap(center: snapshot.data,);
                return MyIndicator(Indicator.ballPulseRise);
              }
            ),
          ],
        )),
      ),
    );
  }
}

class FireMap extends StatefulWidget {
  final Position center;

  const FireMap({Key key, @required this.center}) : super(key: key);

  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  GoogleMapController _controller;


  static final _logger = Logger('Fire Map');
  @override
  void initState() {
    networkBloc = ProviderNetworkBloc(widget.center);
    super.initState();
  }
  ProviderNetworkBloc  networkBloc;



  @override
  Widget build(BuildContext context) {
//networkBloc.setMarkers();
    // addGeoData();

    return Stack(
      children: [
        StreamBuilder<Set<Marker>>(
            stream: networkBloc.getMarkers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GoogleMap(
                  indoorViewEnabled: true,
                  myLocationEnabled: true,
                  markers: snapshot.data,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(widget.center.latitude, widget.center.longitude),
                      zoom: 12),
                  gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(
                            () => PanGestureRecognizer())),
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;

                      _controller.moveCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                              target: LatLng(widget.center.latitude, widget.center.longitude),
                              zoom: 15)));
                    });
                  },
                );
              }
              return MyIndicator(Indicator.ballGridBeat);
            }),
        VisiblilitySlider(networkBloc: networkBloc)
      ],
    );
  }
}
class VisiblilitySlider extends StatefulWidget {
  final ProviderNetworkBloc networkBloc;
  const VisiblilitySlider({Key key,@required this.networkBloc}) : super(key: key);

  @override
  _VisiblilitySliderState createState() => _VisiblilitySliderState();
}

class _VisiblilitySliderState extends State<VisiblilitySlider> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        left: 10,
        child: Slider(
          min: 0,
          max: 500,
          divisions: 100,
          value: widget.networkBloc.radiusHandler.radiusValue,

          label: 'Radius ${widget.networkBloc.radiusHandler.radiusValue} km',
          onChanged: (radius) {
            setState(() {

              widget.networkBloc.radiusHandler.addToRadius(radius);
            });
          },
          // onChanged: _updateQuery,
        ));
  }
}

