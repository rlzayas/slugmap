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

class Colleges extends StatefulWidget {
  @override
  _CollegesState createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Cowell College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('CowellCollege'),
      position: LatLng(36.99737038347433, -122.05427346220672),
      infoWindow: InfoWindow(
        title: 'Cowell College',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      //   BitmapDescriptor.fromAssetImage(
      //       ImageConfiguration(devicePixelRatio: 2.0),
      //       'assets/marker_icons/College.svg'
      // icon: BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.0), 'assets/marker_icons/College.svg')
    ),
    );

    // Stevenson College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('StevensonCollege'),
      position: LatLng(36.99718747230962, -122.0519119377878),
      infoWindow: InfoWindow(
        title: 'Stevenson College',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // Crown College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('CrownCollege'),
      position: LatLng(37.00044004525279, -122.05452639437944),
      infoWindow: InfoWindow(
        title: 'Crown College',
        snippet: '628 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // Merill College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('MerrillCollege'),
      position: LatLng(36.99996850267072, -122.05330945824518),
      infoWindow: InfoWindow(
        title: 'Merrill College',
        snippet: '641 Merrill Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // Porter College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('PorterCollege'),
      position: LatLng(36.99460980922041, -122.0653309811971),
      infoWindow: InfoWindow(
        title: 'Porter College',
        snippet: '1156 High Street, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // Kresge College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('KresgeCollege'),
      position: LatLng(36.99765919789214, -122.06676649796817),
      infoWindow: InfoWindow(
        title: 'Kresge College',
        snippet: '510 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // Oakes College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('OaksCollege'),
      position: LatLng(36.989929657499914, -122.06277255820748),
      infoWindow: InfoWindow(
        title: 'Oaks College',
        snippet: '231 Oakes Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // Rachel Carson College Marker
    allMarkers.add(Marker(
      markerId: MarkerId('RachelCarsonCollege'),
      position: LatLng(36.99151711141353, -122.0647350052343),
      infoWindow: InfoWindow(
        title: 'Rachel Carson College',
        snippet: '356 Rachel Carson Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // College 9 Marker
    allMarkers.add(Marker(
      markerId: MarkerId('College9'),
      position: LatLng(37.00173913642322, -122.05729768589005),
      infoWindow: InfoWindow(
        title: 'College 9',
        snippet: '702 College Nine Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );

    // College 10 Marker
    allMarkers.add(Marker(
      markerId: MarkerId('College10'),
      position: LatLng(37.00083458438215, -122.05857488511316),
      infoWindow: InfoWindow(
        title: 'College 10',
        snippet: '710 College Ten Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colleges'),
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
