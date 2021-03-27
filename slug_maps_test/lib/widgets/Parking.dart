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

class Parking extends StatefulWidget {
  @override
  _ParkingState createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
//GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(36.989043, -122.058611);
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  double zoomVal=5.0;

  List<Marker> parkingLotList = [
    // East Remote Parking Lot
    Marker(
      markerId: MarkerId('EastRemoteParkingLot'),
      position: LatLng(36.99203741631251, -122.05312085074124),
      infoWindow: InfoWindow(
        title: 'East Remote Parking Lot',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Vadim Parking
    Marker(
      markerId: MarkerId('VadimParking'),
      position: LatLng(37.003064125211885, -122.05382987511449),
      infoWindow: InfoWindow(
        title: 'Vadim Parking ',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // BikeLink - UCSC Engineering 2
    Marker(
      markerId: MarkerId('BikeLinkUCSCEngineering2'),
      position: LatLng(37.00091361781477, -122.06214367853134),
      infoWindow: InfoWindow(
        title: 'BikeLink - UCSC Engineering 2',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // BikeLink - UCSC Baskin
    Marker(
      markerId: MarkerId('BikeLinkUCSCBaskin'),
      position: LatLng(37.000448611438934, -122.06263563208518),
      infoWindow: InfoWindow(
        title: 'BikeLink - UCSC Baskin',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // BikeLink - Science Library
    Marker(
      markerId: MarkerId('BikeLinkScienceLibrary'),
      position: LatLng(36.99894224131143, -122.06073235461466),
      infoWindow: InfoWindow(
        title: 'BikeLink - Science Library',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Parking Lot 114
    Marker(
      markerId: MarkerId('ParkingLot114'),
      position: LatLng(37.00018773303434, -122.05896582287743),
      infoWindow: InfoWindow(
        title: 'Parking Lot 114',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Zipcar
    Marker(
      markerId: MarkerId('Zipcar'),
      position: LatLng(37.000142793660984, -122.05899759905863),
      infoWindow: InfoWindow(
        title: 'Zipcar',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // North Perimeter
    Marker(
      markerId: MarkerId('NorthPerimeter'),
      position: LatLng(37.00254987296524, -122.06590202346045),
      infoWindow: InfoWindow(
        title: 'North Perimeter Parking Lot 150',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Parking Lot 139A
    Marker(
      markerId: MarkerId('ParkingLot139A'),
      position: LatLng(37.001553656934625, -122.06244957438545),
      infoWindow: InfoWindow(
        title: 'Parking Lot 139A',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
  ];

  Widget build(BuildContext context) {
    //phone dimensions
    double phoneWidth = MediaQuery
        .of(context)
        .size
        .width; //375
    double phoneHeight = MediaQuery
        .of(context)
        .size
        .height; //812


    return Scaffold(
      body: Container(
        //Stack: Map, Search/filter selection
        child: Stack(
          children: <Widget>[
            //Google map background
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.35,

              ),
              mapType: _currentMapType,
              onCameraMove: _onCameraMove,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: Set.from(parkingLotList),
            ),

            //Container 2: Full Search bar container
            Container(

              margin: EdgeInsets.only(
                  top: phoneHeight * .05665024631, left: phoneWidth * .048),

              width: phoneWidth * .904,
              height: phoneHeight * .04310344828,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Color(0xffececec),
              ),
            ),
            //*
            //Text for "SEARCH LOATION" *************************************
            //*
            Container(
              width: phoneWidth * .4106666667,
              height: phoneHeight * .02093596059,
              margin: EdgeInsets.only(
                  left: phoneWidth * .1653333333,
                  top: phoneHeight * .06773399015),
              child: Text(
                "Search location",
                style: TextStyle(
                  color: Color(0xff7b7575),
                  fontSize: 12,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.7,
                ),
              ),
            ),
            //Container 3: container for search option with search text
            Container(
              width: phoneWidth * .8106666667,
              height: phoneHeight * .04310344828,
              margin: EdgeInsets.only(
                  top: phoneHeight * .05665024631, left: phoneWidth * .048),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => slugSearch()),);
                },
              ),
            ),

            //
            //The filter button *****************************************
            //
            Container(
              height: phoneHeight * .02463054187,
              width: phoneWidth * .05866666667,
              margin: EdgeInsets.only(top: phoneHeight * .06650246305,
                  left: phoneWidth * .8693333333),
              child: Stack(
                children: <Widget>[

                  FloatingActionButton(
                    // backgroundColor: Color(0xffececec),
                      elevation: 0,
                      child: SvgPicture.asset('assets/images/Filter_menu.svg',
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => slugMapFilter()),
                            MaterialPageRoute(builder: (context) => HikingTrails()),

                        );
                      }
                  )

                ],

              ),

            ),


            Container(
              margin: EdgeInsets.only(
                  left: phoneWidth * .05866666667,
                  top: phoneHeight * .05911330049),
              width: phoneWidth * .08,
              height: phoneHeight * .03694581281,
              child: Image.asset(
                'assets/images/Slug_Logo.png',
              ),

            ),
            _buildContainer(),
          ],
        ),
      ),
    ); //812 x 375
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo1.ggpht.com/maps/photothumb/fd/v1?bpb=ChEKD3NlYXJjaC5nd3MtcHJvZBIgChIJqc3s6XRBjoARG5Dso9ZUKTQqCg0AAAAAFQAAAAAaBgjwARCYAw&gl=US",
                  37.001553656934625, -122.06244957438545,"Parking Lot 139A", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=kVkqVqDR6BQpkriwNIDF4g&cb_client=search.gws-prod.gps&w=408&h=240&yaw=94.35598&pitch=0&thumbfov=100",
                  37.00254987296524, -122.06590202346045,"North Perimeter Parking Lot 150", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo0.ggpht.com/maps/photothumb/fd/v1?bpb=ChEKD3NlYXJjaC5nd3MtcHJvZBIgChIJZ392kQpBjoARs9UJ7qw7LHgqCg0AAAAAFQAAAAAaBgjwARCYAw&gl=US",
                  37.000142793660984, -122.05899759905863,"ZipCar", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo0.ggpht.com/maps/photothumb/fd/v1?bpb=ChEKD3NlYXJjaC5nd3MtcHJvZBIgChIJZ392kQpBjoARs9UJ7qw7LHgqCg0AAAAAFQAAAAAaBgjwARCYAw&gl=US",
                  37.00018773303434, -122.05896582287743,"Parking Lot 114", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "",
                  36.99894224131143, -122.06073235461466,"BikeLink - Science Library", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "",
                  37.000448611438934, -122.06263563208518,"BikeLink - UCSC Baskin", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMZg93kzYRE5QvAoxVuug4Cp-7v81GhwyI3K7Tb=w426-h240-k-no",
                  37.00091361781477, -122.06214367853134,"BikeLink - UCSC Engineering 2", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "",
                  37.003064125211885, -122.05382987511449,"Vadim Parking", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "",
                  36.99203741631251, -122.05312085074124,"East Remote Parking Lot", ""),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String title, String snippet) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      myDetailsContainer1(title, snippet),),
                  )

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String title, String snippet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(title,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      snippet,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
      ],
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

}
