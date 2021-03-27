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

class EVChargeStation extends StatefulWidget {
  @override
  _EVChargeStationState createState() => _EVChargeStationState();
}

class _EVChargeStationState extends State<EVChargeStation> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // EV Charging Station 1 Marker
    allMarkers.add(Marker(
        markerId: MarkerId('OceanST'),
        position: LatLng(36.9788943336269, -122.0223634179128),
        infoWindow: InfoWindow(
          title: 'EV ChargePoint Charging Station',
          snippet: '701 Ocean St, Santa Cruz, CA 95060',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
    )
    );

    // EV Charging Station 2 Marker
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

    // EV Charging Station 3 Marker
    allMarkers.add(Marker(
      markerId: MarkerId('Soquel Ave'),
      position: LatLng(36.98174810947192, -122.01507687519172),
      infoWindow: InfoWindow(
        title: 'EV ChargePoint Charging Station',
        snippet: '911 Soquel Ave, Santa Cruz, CA 95062',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    );
  }

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
