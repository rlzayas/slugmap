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

class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // East Remote Parking Lot
    allMarkers.add(Marker(
      markerId: MarkerId('EastRemoteParkingLot'),
      position: LatLng(36.99203741631251, -122.05312085074124),
      infoWindow: InfoWindow(
        title: 'East Remote Parking Lot',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Vadim Parking
    allMarkers.add(Marker(
      markerId: MarkerId('VadimParking'),
      position: LatLng(37.003064125211885, -122.05382987511449),
      infoWindow: InfoWindow(
        title: 'Vadim Parking ',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // BikeLink - UCSC Engineering 2
    allMarkers.add(Marker(
      markerId: MarkerId('BikeLinkUCSCEngineering2'),
      position: LatLng(37.00091361781477, -122.06214367853134),
      infoWindow: InfoWindow(
        title: 'BikeLink - UCSC Engineering 2',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // BikeLink - UCSC Baskin
    allMarkers.add(Marker(
      markerId: MarkerId('BikeLinkUCSCBaskin'),
      position: LatLng(37.000448611438934, -122.06263563208518),
      infoWindow: InfoWindow(
        title: 'BikeLink - UCSC Baskin',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // BikeLink - Science Library
    allMarkers.add(Marker(
      markerId: MarkerId('BikeLinkScienceLibrary'),
      position: LatLng(36.99894224131143, -122.06073235461466),
      infoWindow: InfoWindow(
        title: 'BikeLink - Science Library',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Parking Lot 114
    allMarkers.add(Marker(
      markerId: MarkerId('ParkingLot114'),
      position: LatLng(37.00018773303434, -122.05896582287743),
      infoWindow: InfoWindow(
        title: 'Parking Lot 114',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Zipcar
    allMarkers.add(Marker(
      markerId: MarkerId('Zipcar'),
      position: LatLng(37.000142793660984, -122.05899759905863),
      infoWindow: InfoWindow(
        title: 'Zipcar',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // North Perimeter
    allMarkers.add(Marker(
      markerId: MarkerId('NorthPerimeter'),
      position: LatLng(37.00254987296524, -122.06590202346045),
      infoWindow: InfoWindow(
        title: 'North Perimeter',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Parking Lot 139A
    allMarkers.add(Marker(
      markerId: MarkerId('ParkingLot139A'),
      position: LatLng(37.001553656934625, -122.06244957438545),
      infoWindow: InfoWindow(
        title: 'Parking Lot 139A',
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
        title: Text('Parking Lots'),
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
