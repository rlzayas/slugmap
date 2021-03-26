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

class EVFilterPage extends StatefulWidget {
  @override
  _EVFilterPageState createState() => _EVFilterPageState();
}

class _EVFilterPageState extends State<EVFilterPage> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    allMarkers.add(Marker(
        markerId: MarkerId('McLaughlinDr'),
        position: LatLng(36.999324250111506, -122.0632982467481),
        infoWindow: InfoWindow(
          title: 'EV ChargePoint Charging Station',
          snippet: ' McLaughlin Dr, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      );

      allMarkers.add(Marker(
        markerId: MarkerId('CrownMerrillDH'),
        position: LatLng(37.00014429303811, -122.05440605538377),
        infoWindow: InfoWindow(
          title: 'Crown/Merrill Dining Hall',
          snippet: '630 Crown Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      );
  }

  // void showPinsOnMap() {
  //   // _markers.addAll(DiningHallList)
  //
  //   _markers.add(Marker(
  //     markerId: MarkerId('OceanST'),
  //     position: LatLng(36.9788943336269, -122.0223634179128),
  //     infoWindow: InfoWindow(
  //       title: 'EV ChargePoint Charging Station',
  //       snippet: '701 Ocean St, Santa Cruz, CA 95060',
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   )
  //   );
  //
  //
  //   _markers.add(Marker(
  //     markerId: MarkerId('McLaughlinDr'),
  //     position: LatLng(36.999324250111506, -122.0632982467481),
  //     infoWindow: InfoWindow(
  //       title: 'EV ChargePoint Charging Station',
  //       snippet: ' McLaughlin Dr, Santa Cruz, CA 95064',
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   );
  //
  //   _markers.add(Marker(
  //     markerId: MarkerId('Soquel Ave'),
  //     position: LatLng(36.98174810947192, -122.01507687519172),
  //     infoWindow: InfoWindow(
  //       title: 'EV ChargePoint Charging Station',
  //       snippet: '911 Soquel Ave, Santa Cruz, CA 95062',
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EV Charge Stations'),
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
