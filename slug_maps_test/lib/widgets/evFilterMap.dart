import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';

class EVFilterMap extends StatefulWidget {
  @override
  _EVFilterMapState createState() => _EVFilterMapState();
}

class _EVFilterMapState extends State<EVFilterMap> {
  Completer<GoogleMapController> _controller = Completer();

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EV Charge Stations'),
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
        ],
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(36.989043, -122.058611),
              zoom: 14.35,
          ),
          // onMapCreated: (GoogleMapController controller) {
          //   _controller.complete(controller); }, //use onMapCreated method style from slugMapMain
          markers: {
            evMarker1, evMarker2, evMarker3,
          },
      ),
    );
  }
}

Marker evMarker1 = Marker(
  markerId: MarkerId('CowellStevensonDH'),
  position: LatLng(36.99684124370638, -122.05303038435036),
  infoWindow: InfoWindow(
    title: 'Cowell/Stevenson Dining Hall',
    snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
);

Marker evMarker2 = Marker(
  markerId: MarkerId('McLaughlinDr'),
  position: LatLng(36.999324250111506, -122.0632982467481),
  infoWindow: InfoWindow(
    title: 'EV ChargePoint Charging Station',
    snippet: ' McLaughlin Dr, Santa Cruz, CA 95064',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
);

Marker evMarker3 = Marker(
  markerId: MarkerId('CrownMerrillDH'),
  position: LatLng(37.00014429303811, -122.05440605538377),
  infoWindow: InfoWindow(
    title: 'Crown/Merrill Dining Hall',
    snippet: '630 Crown Rd, Santa Cruz, CA 95064',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
);

