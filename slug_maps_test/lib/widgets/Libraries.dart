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

class Libraries extends StatefulWidget {
  @override
  _LibrariesState createState() => _LibrariesState();
}

class _LibrariesState extends State<Libraries> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Adlai E. Stevenson Library
    allMarkers.add(Marker(
      markerId: MarkerId('AdlaiEStevensonLibrary'),
      position: LatLng(36.99722897221115, -122.05151323142576),
      infoWindow: InfoWindow(
        title: 'Adlai E. Stevenson Library',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Page Smith Library
    allMarkers.add(Marker(
      markerId: MarkerId('PageSmithLibrary'),
      position: LatLng(36.99716490316114, -122.0536526692152),
      infoWindow: InfoWindow(
        title: 'Page Smith Library',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Merrill Library
    allMarkers.add(Marker(
      markerId: MarkerId('MerrillLibrary'),
      position: LatLng(36.999711831435256, -122.05336351136583),
      infoWindow: InfoWindow(
        title: 'Merrill Library',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Crown Library
    allMarkers.add(Marker(
      markerId: MarkerId('CrownLibrary'),
      position: LatLng(36.99993912279547, -122.05486909133349),
      infoWindow: InfoWindow(
        title: 'Crown Library',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // McHenry Library
    allMarkers.add(Marker(
      markerId: MarkerId('McHenryLibrary'),
      position: LatLng(36.99578136536548, -122.05888865898311),
      infoWindow: InfoWindow(
        title: 'McHenry Library',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // Science & Engineering Library
    allMarkers.add(Marker(
      markerId: MarkerId('Science&EngineeringLibrary'),
      position: LatLng(36.99910517369182, -122.06059399782959),
      infoWindow: InfoWindow(
        title: 'Science & Engineering Library',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Kresge Student Library
    allMarkers.add(Marker(
      markerId: MarkerId('KresgeStudentLibrary'),
      position: LatLng(36.997603292930194, -122.06623329784122),
      infoWindow: InfoWindow(
        title: 'Kresge Student Library',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Oaks Library
    allMarkers.add(Marker(
      markerId: MarkerId('Oaks Library'),
      position: LatLng(36.989953862713904, -122.06289888474468),
      infoWindow: InfoWindow(
        title: 'Oaks Library',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libraries'),
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
