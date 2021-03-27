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

class Views extends StatefulWidget {
  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Stevenson Knoll Marker
    allMarkers.add(Marker(
        markerId: MarkerId('Stevenson Knoll'),
        position: LatLng(36.996041133200166, -122.05165615971505),
        infoWindow: InfoWindow(
          title: 'Stevenson Knoll',
          snippet: 'Casa Sexta, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
    )
    );

    // Porter Squiggle Marker
    allMarkers.add(Marker(
      markerId: MarkerId('Porter Squiggle'),
      position: LatLng(36.99340877871167, -122.06515297320963),
      infoWindow: InfoWindow(
        title: 'Porter Squiggle',
        snippet: '200 Heller Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    );

    // Pogonip Vista Point Marker
    allMarkers.add(Marker(
      markerId: MarkerId('Pogonip Vista Point'),
      position: LatLng(36.99067567820772, -122.04909315971524),
      infoWindow: InfoWindow(
        title: 'Pogonip Vista Point',
        snippet: 'Santa Cruz, CA 95060',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Santa Cruz Views'),
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