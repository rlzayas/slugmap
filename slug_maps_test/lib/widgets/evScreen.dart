import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';

class EVScreen extends StatefulWidget {
  @override
  _EVScreenState createState() => _EVScreenState();
}

class _EVScreenState extends State<EVScreen> {
  Completer<GoogleMapController> _controller = Completer();
  var myMarkers = HashSet<Marker>(); //collection

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
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(36.989043, -122.058611),
                zoom: 14.35,),
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  myMarkers.add(Marker(
                    markerId: MarkerId('9&10DH'),
                    position: LatLng(37.00074493904557, -122.05776568771819),
                    infoWindow: InfoWindow(
                      title: 'Colleges 9 & 10 Dining Hall',
                      snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                  ),
                  );

                  myMarkers.add(Marker(
                  markerId: MarkerId('CrownMerrillDH'),
                  position: LatLng(37.00014429303811, -122.05440605538377),
                  infoWindow: InfoWindow(
                  title: 'Crown/Merrill Dining Hall',
                  snippet: '630 Crown Rd, Santa Cruz, CA 95064',
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                  ),
                  );

                  myMarkers.add(Marker(
                  markerId: MarkerId('CowellStevensonDH'),
                  position: LatLng(36.99684124370638, -122.05303038435036),
                  infoWindow: InfoWindow(
                  title: 'Cowell/Stevenson Dining Hall',
                  snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                  ),
                  );


                }//setState
                );
              },
              markers: myMarkers,
            ),
          ],
        ),
    );
  }
}

//
// List<Marker> DiningHallList = [
//   Marker(
//     markerId: MarkerId('9&10DH'),
//     position: LatLng(37.00074493904557, -122.05776568771819),
//     infoWindow: InfoWindow(
//       title: 'Colleges 9 & 10 Dining Hall',
//       snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
//     ),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//   ),
//   Marker(
//     markerId: MarkerId('CrownMerrillDH'),
//     position: LatLng(37.00014429303811, -122.05440605538377),
//     infoWindow: InfoWindow(
//       title: 'Crown/Merrill Dining Hall',
//       snippet: '630 Crown Rd, Santa Cruz, CA 95064',
//     ),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//   ),
//   Marker(
//     markerId: MarkerId('CowellStevensonDH'),
//     position: LatLng(36.99684124370638, -122.05303038435036),
//     infoWindow: InfoWindow(
//       title: 'Cowell/Stevenson Dining Hall',
//       snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//     ),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//   ),
//   Marker(
//     markerId: MarkerId('PorterKresgeDH'),
//     position: LatLng(36.99431757933324, -122.06594174458701),
//     infoWindow: InfoWindow(
//       title: 'Porter/Kresge Dining Hall',
//       snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//     ),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//   ),
//   Marker(
//     markerId: MarkerId('RCCOaksDH'),
//     position: LatLng(36.99169329799685, -122.06539542111443),
//     infoWindow: InfoWindow(
//       title: 'Rachel Carson/Oaks Dining Hall',
//       snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//     ),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//   ),
// ];