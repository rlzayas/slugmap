import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Filter files
import 'package:testing_app/widgets/Colleges.dart';
import 'package:testing_app/widgets/DiningHalls.dart';
import 'package:testing_app/widgets/EVChargeStation.dart';
import 'package:testing_app/widgets/WaterFillStation.dart';
import 'package:testing_app/widgets/Views.dart';

import 'package:testing_app/widgets/HikingTrails.dart';
import 'package:testing_app/widgets/Libraries.dart';
import 'package:testing_app/widgets/Parking.dart';
import 'package:testing_app/widgets/BusStops.dart';

import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HikingTrails extends StatefulWidget {
  @override
  _HikingTrailsState createState() => _HikingTrailsState();
}

class _HikingTrailsState extends State<HikingTrails> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Cave Gulch
    allMarkers.add(Marker(
      markerId: MarkerId('CaveGulch'),
      position: LatLng(36.99403252521436, -122.0690402904878),
      infoWindow: InfoWindow(
        title: 'Cave Gulch',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Great Meadow
    allMarkers.add(Marker(
      markerId: MarkerId('GreatMeadow'),
      position: LatLng(36.99232292142072, -122.05782280429814),
      infoWindow: InfoWindow(
        title: 'Great Meadow',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Heller Hill Road Trailhead
    allMarkers.add(Marker(
      markerId: MarkerId('HellerHillRoadTrailhead'),
      position: LatLng(37.00348848930636, -122.06596338499335),
      infoWindow: InfoWindow(
        title: 'Heller Hill Road Trailhead',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );


    // Speed Zone Interpretive Trail
    allMarkers.add(Marker(
      markerId: MarkerId('SpeedZoneInterpretiveTrail'),
      position: LatLng(37.00336248460905, -122.06083630318761),
      infoWindow: InfoWindow(
        title: 'Speed Zone Interpretive Trail',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // College 9 Trailhead
    allMarkers.add(Marker(
      markerId: MarkerId('College9Trailhead'),
      position: LatLng(37.00196297615762, -122.05787660963959),
      infoWindow: InfoWindow(
        title: 'College 9 Trailhead',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // College 10 Trailhead
    allMarkers.add(Marker(
      markerId: MarkerId('College10Trailhead'),
      position: LatLng(37.003746885938995, -122.05874986883879),
      infoWindow: InfoWindow(
        title: 'College 10 Trailhead',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Chinquapin Road Trailhead
    allMarkers.add(Marker(
      markerId: MarkerId('ChinquapinRoadTrailhead'),
      position: LatLng(37.002261789871916, -122.05607049993415),
      infoWindow: InfoWindow(
        title: 'Chinquapin Road Trailhead',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // U-Con Trail Trailhead
    allMarkers.add(Marker(
      markerId: MarkerId('UConTrailTrailhead'),
      position: LatLng(37.00225807152155, -122.05200633736733),
      infoWindow: InfoWindow(
        title: 'U-Con Trail Trailhead',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Koi Pond
    allMarkers.add(Marker(
      markerId: MarkerId('Koi Pond'),
      position: LatLng(37.00024830740773, -122.04829250486237),
      infoWindow: InfoWindow(
        title: 'Koi Pond',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Pogonip Historic Limekiln
    allMarkers.add(Marker(
      markerId: MarkerId('PogonipHistoricLimekiln'),
      position: LatLng(37.001319840045156, -122.04933310285453),
      infoWindow: InfoWindow(
        title: 'Pogonip Historic Limekiln',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Empire Cave
    allMarkers.add(Marker(
      markerId: MarkerId('Empire Cave'),
      position: LatLng(36.99617636224744, -122.06883543180497),
      infoWindow: InfoWindow(
        title: 'EmpireCave',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Porter Koi Pond
    allMarkers.add(Marker(
      markerId: MarkerId('PorterKoiPond'),
      position: LatLng(36.99420990009598, -122.06536281070382),
      infoWindow: InfoWindow(
        title: 'Porter Koi Pond',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Crown Meadow
    allMarkers.add(Marker(
      markerId: MarkerId('CrownMeadow'),
      position: LatLng(37.002720138086666, -122.05264625461085),
      infoWindow: InfoWindow(
        title: 'Crown Meadow',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Crown Meadow
    allMarkers.add(Marker(
      markerId: MarkerId('CrownMeadow2'),
      position: LatLng(37.00457530902208, -122.05735124061187),
      infoWindow: InfoWindow(
        title: 'Crown Meadow',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Seep Zone Interpretive Trail
    allMarkers.add(Marker(
      markerId: MarkerId('SeepZoneInterpretiveTrail'),
      position: LatLng(37.003359289995295, -122.06094499992527),
      infoWindow: InfoWindow(
        title: 'Seep Zone Interpretive Trail',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiking Trails'),
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
