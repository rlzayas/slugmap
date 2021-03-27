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

class DiningHalls extends StatefulWidget {
  @override
  _DiningHallsState createState() => _DiningHallsState();
}

class _DiningHallsState extends State<DiningHalls> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // College 9 and College 10 Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('9&10DH'),
      position: LatLng(37.00074493904557, -122.05776568771819),
      infoWindow: InfoWindow(
        title: 'Colleges 9 & 10 Dining Hall',
        snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Crown College and Merill College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('CrownMerrillDH'),
      position: LatLng(37.00014429303811, -122.05440605538377),
      infoWindow: InfoWindow(
        title: 'Crown/Merrill Dining Hall',
        snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Cowell College and Stevenson College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('CowellStevensonDH'),
      position: LatLng(36.99684124370638, -122.05303038435036),
      infoWindow: InfoWindow(
        title: 'Cowell/Stevenson Dining Hall',
        snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Porter College and Kresge College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('PorterKresgeDH'),
      position: LatLng(36.99431757933324, -122.06594174458701),
      infoWindow: InfoWindow(
        title: 'Porter/Kresge Dining Hall',
        snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Rachel Carson College and Oakes College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('RCCOaksDH'),
      position: LatLng(36.99169329799685, -122.06539542111443),
      infoWindow: InfoWindow(
        title: 'Rachel Carson/Oaks Dining Hall',
        snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('College Dining Halls'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(36.989043, -122.058611),
              zoom: 14.35,
            ),
            markers: Set.from(allMarkers),
          ),
        ),
      ),
    );
  }
}
