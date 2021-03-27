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

class WaterFillStation extends StatefulWidget {
  @override
  _WaterFillStationState createState() => _WaterFillStationState();
}

class _WaterFillStationState extends State<WaterFillStation> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Classroom Unit Marker
    allMarkers.add(Marker(
      markerId: MarkerId('ClassroomUnit'),
      position: LatLng(36.99803687001237, -122.05683525820898),
      infoWindow: InfoWindow(
        title: 'ClassroomUnit',
        //snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // Science Hill Marker
    allMarkers.add(Marker(
      markerId: MarkerId('ScienceHill'),
      position: LatLng(36.99786721918895, -122.05834495838793),
      infoWindow: InfoWindow(
        title: 'Science Hill',
        //snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // Baytree Book Store / Quarry Plaza Marker
    allMarkers.add(Marker(
      markerId: MarkerId('QuarryPlaza'),
      position: LatLng(36.99811991616817, -122.05571328710818),
      infoWindow: InfoWindow(
        title: 'BayTree Bookstore/Quarry Plaza',
        //snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // McHenry Library Marker
    allMarkers.add(Marker(
      markerId: MarkerId('McHenry'),
      position: LatLng(36.99578136536548, -122.05888865898311),
      infoWindow: InfoWindow(
        title: 'McHenry Library',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // Media Theater Marker
    allMarkers.add(Marker(
      markerId: MarkerId('MediaTheater'),
      position: LatLng(36.99525351792488, -122.06164320692419),
      infoWindow: InfoWindow(
        title: 'Media Theater',
        snippet: '453 Kerr Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // Earth & Marine Sciences Building Marker
    allMarkers.add(Marker(
      markerId: MarkerId('Earth&Marine'),
      position: LatLng(36.99819000796422, -122.05963315215398),
      infoWindow: InfoWindow(
        title: 'Earth & Marine Sciences Building',
        // snippet: 'Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // OPERS Upper East Field Marker
    allMarkers.add(Marker(
      markerId: MarkerId('OPERS'),
      position: LatLng(36.99483333081348, -122.05406975033789),
      infoWindow: InfoWindow(
        title: 'OPERS Upper East Field',
        // snippet: 'Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );

    // Jack Baskin School of Engineering Marker
    allMarkers.add(Marker(
      markerId: MarkerId('BSOE'),
      position: LatLng(37.00058470510099, -122.06325024650194),
      infoWindow: InfoWindow(
        title: 'Jack Baskin Engineering',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Filling Stations'),
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
