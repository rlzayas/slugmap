import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testing_app/widgets/CollegesFilter.dart';
import 'package:testing_app/widgets/evFilterMap.dart';
import 'package:testing_app/widgets/evFilterPage.dart';
//import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';


class EVMap extends StatefulWidget {
  @override
  _EVMapState createState() => _EVMapState();
}

class _EVMapState extends State<EVMap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    CameraPosition initialCameraPosition = CameraPosition(
        target: LatLng(36.989043, -122.058611),
        zoom: 14.35,
    );

    return Scaffold(
      body: Container(
        child: GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              showPinsOnMap();
            },
        )
      ),
    );
  }





  void showPinsOnMap() {
    // _markers.addAll(DiningHallList)

    _markers.add(Marker(
      markerId: MarkerId('9&10DH'),
      position: LatLng(37.00074493904557, -122.05776568771819),
      infoWindow: InfoWindow(
        title: 'Colleges 9 & 10 Dining Hall',
        snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    _markers.add(Marker(
      markerId: MarkerId('CowellStevensonDH'),
      position: LatLng(36.99684124370638, -122.05303038435036),
      infoWindow: InfoWindow(
        title: 'Cowell/Stevenson Dining Hall',
        snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    _markers.add(Marker(
      markerId: MarkerId('CrownMerrillDH'),
      position: LatLng(37.00014429303811, -122.05440605538377),
      infoWindow: InfoWindow(
        title: 'Crown/Merrill Dining Hall',
        snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );
  }

}
