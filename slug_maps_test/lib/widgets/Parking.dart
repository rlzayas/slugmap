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
  List<Marker> allMarkers= [];

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  double zoomVal=5.0;

  List<Marker> ParkingLotList = [
    // East Remote Parking Lot
    Marker(
      markerId: MarkerId('EastRemoteParkingLot'),
      position: LatLng(36.99203741631251, -122.05312085074124),
      infoWindow: InfoWindow(
        title: 'East Remote Parking Lot',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Vadim Parking
    Marker(
      markerId: MarkerId('VadimParking'),
      position: LatLng(37.003064125211885, -122.05382987511449),
      infoWindow: InfoWindow(
        title: 'Vadim Parking ',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // BikeLink - UCSC Engineering 2
    Marker(
      markerId: MarkerId('BikeLinkUCSCEngineering2'),
      position: LatLng(37.00091361781477, -122.06214367853134),
      infoWindow: InfoWindow(
        title: 'BikeLink - UCSC Engineering 2',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // BikeLink - UCSC Baskin
    Marker(
      markerId: MarkerId('BikeLinkUCSCBaskin'),
      position: LatLng(37.000448611438934, -122.06263563208518),
      infoWindow: InfoWindow(
        title: 'BikeLink - UCSC Baskin',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // BikeLink - Science Library
    Marker(
      markerId: MarkerId('BikeLinkScienceLibrary'),
      position: LatLng(36.99894224131143, -122.06073235461466),
      infoWindow: InfoWindow(
        title: 'BikeLink - Science Library',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Parking Lot 114
    Marker(
      markerId: MarkerId('ParkingLot114'),
      position: LatLng(37.00018773303434, -122.05896582287743),
      infoWindow: InfoWindow(
        title: 'Parking Lot 114',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Zipcar
    Marker(
      markerId: MarkerId('Zipcar'),
      position: LatLng(37.000142793660984, -122.05899759905863),
      infoWindow: InfoWindow(
        title: 'Zipcar',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // North Perimeter
    Marker(
      markerId: MarkerId('NorthPerimeter'),
      position: LatLng(37.00254987296524, -122.06590202346045),
      infoWindow: InfoWindow(
        title: 'North Perimeter',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Parking Lot 139A
    Marker(
      markerId: MarkerId('ParkingLot139A'),
      position: LatLng(37.001553656934625, -122.06244957438545),
      infoWindow: InfoWindow(
        title: 'Parking Lot 139A',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

  ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // East Remote Parking Lot
//     allMarkers.add(Marker(
//       markerId: MarkerId('EastRemoteParkingLot'),
//       position: LatLng(36.99203741631251, -122.05312085074124),
//       infoWindow: InfoWindow(
//         title: 'East Remote Parking Lot',
//         // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Vadim Parking
//     allMarkers.add(Marker(
//       markerId: MarkerId('VadimParking'),
//       position: LatLng(37.003064125211885, -122.05382987511449),
//       infoWindow: InfoWindow(
//         title: 'Vadim Parking ',
//         // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // BikeLink - UCSC Engineering 2
//     allMarkers.add(Marker(
//       markerId: MarkerId('BikeLinkUCSCEngineering2'),
//       position: LatLng(37.00091361781477, -122.06214367853134),
//       infoWindow: InfoWindow(
//         title: 'BikeLink - UCSC Engineering 2',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // BikeLink - UCSC Baskin
//     allMarkers.add(Marker(
//       markerId: MarkerId('BikeLinkUCSCBaskin'),
//       position: LatLng(37.000448611438934, -122.06263563208518),
//       infoWindow: InfoWindow(
//         title: 'BikeLink - UCSC Baskin',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // BikeLink - Science Library
//     allMarkers.add(Marker(
//       markerId: MarkerId('BikeLinkScienceLibrary'),
//       position: LatLng(36.99894224131143, -122.06073235461466),
//       infoWindow: InfoWindow(
//         title: 'BikeLink - Science Library',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Parking Lot 114
//     allMarkers.add(Marker(
//       markerId: MarkerId('ParkingLot114'),
//       position: LatLng(37.00018773303434, -122.05896582287743),
//       infoWindow: InfoWindow(
//         title: 'Parking Lot 114',
//         // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Zipcar
//     allMarkers.add(Marker(
//       markerId: MarkerId('Zipcar'),
//       position: LatLng(37.000142793660984, -122.05899759905863),
//       infoWindow: InfoWindow(
//         title: 'Zipcar',
//         // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // North Perimeter
//     allMarkers.add(Marker(
//       markerId: MarkerId('NorthPerimeter'),
//       position: LatLng(37.00254987296524, -122.06590202346045),
//       infoWindow: InfoWindow(
//         title: 'North Perimeter',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Parking Lot 139A
//     allMarkers.add(Marker(
//       markerId: MarkerId('ParkingLot139A'),
//       position: LatLng(37.001553656934625, -122.06244957438545),
//       infoWindow: InfoWindow(
//         title: 'Parking Lot 139A',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Parking Lots'),
//       ),
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(36.989043, -122.058611),
//               zoom: 14.35,
//             ),
//             markers: Set.from(allMarkers),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
              markers: Set.from(ParkingLotList),
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

                            // MaterialPageRoute(
                            //     builder: (context) => slugMapFilter()),

                            // showPinsOnMap(),

                            // MaterialPageRoute(builder: (context) => CollegesFilter()),
                            // MaterialPageRoute(builder: (context) => EVFilterMap()),
                            // MaterialPageRoute(builder: (context) => EVFilterPage()), //works
                            // MaterialPageRoute(builder: (context) => EVMap()),

                            // MaterialPageRoute(builder: (context) => EVScreen()), //works

                            // MaterialPageRoute(builder: (context) => Colleges()),
                            // MaterialPageRoute(builder: (context) => DiningHalls()),
                            // MaterialPageRoute(builder: (context) => EVChargeStation()),
                            // MaterialPageRoute(builder: (context) => WaterFillStation()),
                            // MaterialPageRoute(builder: (context) => Views()),

                            // MaterialPageRoute(builder: (context) => BusStops())
                            // MaterialPageRoute(builder: (context) => Parking())
                          // MaterialPageRoute(builder: (context) => Libraries())
                          MaterialPageRoute(builder: (context) => HikingTrails())

                          // MaterialPageRoute(builder: (context) => EVScreen()), //works

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
            _zoomminusfunction(),
            _zoomplusfunction(),
            _buildContainer(),
          ],
        ),
      ),
    ); //812 x 375
  }


  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.home),//Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.add),//Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(36.989043, -122.058611), zoom: zoomVal)));
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
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  40.738380, -73.988426,"Gramercy Tavern", 'hola'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421, -73.981667,"Le Bernardin", 'wassup'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128, -73.999619,"Slug Maps", "DSC Solution Challenge"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName, String info) {
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
                  // Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child:
                  //       myDetailsContainer1(restaurantName),
                  //   ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: myDetailsContainer1(info),
                  // ),
                  // ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      myDetailsContainer1(restaurantName, info),),
                  )

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName, String info) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
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
                      info,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStarHalf,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //             child: Text(
                //               "(946)",
                //               style: TextStyle(
                //                 color: Colors.black54,
                //                 fontSize: 18.0,
                //               ),
                //             )),
              ],
            )),
        // SizedBox(height:5.0),
        // Container(
        //     child: Text(
        //       "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
        //       style: TextStyle(
        //         color: Colors.black54,
        //         fontSize: 18.0,
        //       ),
        //     )),
        // SizedBox(height:5.0),
        // Container(
        //     child: Text(
        //       "Closed \u00B7 Opens 17:00 Thu",
        //       style: TextStyle(
        //           color: Colors.black54,
        //           fontSize: 18.0,
        //           fontWeight: FontWeight.bold),
        //     )),
      ],
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

}