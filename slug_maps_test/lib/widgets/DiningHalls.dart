import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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

class DiningHalls extends StatefulWidget {
  @override
  _DiningHallsState createState() => _DiningHallsState();
}

class _DiningHallsState extends State<DiningHalls> {
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

  List<Marker> diningHallList = [
    // College 9 & 10 Dining Hall
    Marker(
      markerId: MarkerId('9&10DH'),
      position: LatLng(37.00074493904557, -122.05776568771819),
      infoWindow: InfoWindow(
        title: 'Colleges 9 & 10 Dining Hall',
        snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Crown/Merrill Dining Hall
    Marker(
      markerId: MarkerId('CrownMerrillDH'),
      position: LatLng(37.00014429303811, -122.05440605538377),
      infoWindow: InfoWindow(
        title: 'Crown/Merrill Dining Hall',
        snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Cowell/ Stevenson Dining Hall
    Marker(
      markerId: MarkerId('CowellStevensonDH'),
      position: LatLng(36.99684124370638, -122.05303038435036),
      infoWindow: InfoWindow(
        title: 'Cowell/Stevenson Dining Hall',
        snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Porter Kresge Dining Hall
    Marker(
      markerId: MarkerId('PorterKresgeDH'),
      position: LatLng(36.99431757933324, -122.06594174458701),
      infoWindow: InfoWindow(
        title: 'Porter/Kresge Dining Hall',
        snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // Rachel Carson/Oaks College Dining Hall
    Marker(
      markerId: MarkerId('RCCOakesDH'),
      position: LatLng(36.99169329799685, -122.06539542111443),
      infoWindow: InfoWindow(
        title: 'Rachel Carson/Oakes Dining Hall',
        snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
  ];

  SpeedDial buildSpeedDial() {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;

    return SpeedDial(
      /// both default to 16
      marginEnd: 18,
      marginBottom: phoneHeight -160,
      // marginEnd: 18,
      // marginBottom: 670,
      animatedIcon: AnimatedIcons.menu_close,
      // animatedIconTheme: IconThemeData(size: 22.0),

      /// This is ignored if animatedIcon is non null
      //icon: Icons.add,
      //activeIcon: Icons.remove,
      // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),

      /// The label of the main button.
      //label: Text("Open Speed Dial"),

      /// The active label of the main button, Defaults to label if not specified.
      //activeLabel: Text("Close Speed Dial"),

      /// Transition Builder between label and activeLabel, defaults to FadeTransition.
      //labelTransitionBuilder: (widget, animation) =>
      //ScaleTransition(scale: animation, child: widget),

      /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
      // buttonSize: 56.0,
      // visible: true,

      /// If true user is forced to close dial manually
      /// by tapping main button and overlay is not rendered.
      closeManually: false,
      // curve: Curves.bounceIn,
      // overlayColor: Colors.black,
      // overlayOpacity: 0.5,
      // onOpen: () => print('OPENING DIAL'),
      // onClose: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => slugMapMain()),
      //   );
      // },
      // tooltip: 'Speed Dial',
      // heroTag: 'speed-dial-hero-tag',
      // backgroundColor: Colors.white,
      // foregroundColor: Colors.black,
      // elevation: 8.0,
      // shape: CircleBorder(),
      //
      orientation: SpeedDialOrientation.Down,
      childMarginBottom: 2,
      childMarginTop: 2,
      // gradientBoxShape: BoxShape.circle,
      // gradient: LinearGradient(
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      //   colors: [Colors.black, Colors.white],
      // ),
      children: [
        SpeedDialChild(
          child: Icon(Icons.apartment),
          // child: SvgPicture.asset('assets/images/apartment-black-18dp.svg'),
          label: 'Colleges',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            // currentMarkers.clear();
            // currentMarkers.addAll(evStationList);
            //
            Navigator.push(
              context,
              //
              MaterialPageRoute(builder: (context) => Colleges()),
            );
          },
          onLongPress: () => print('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          // child: Icon(Icons),
          child: SvgPicture.asset('assets/images/restaurant-black-18dp.svg'),
          label: 'Dining halls',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiningHalls()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/import_contacts-24px.svg'),
          label: 'Libraries',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Libraries()),
            );
          },
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/directions_bus-24px.svg'),
          label: 'Bus stops',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BusStops()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/local_parking-24px.svg'),
          label: 'Parking',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Parking()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/directions_walk-24px.svg'),
          label: 'Hiking Trails',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HikingTrails()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/local_see-24px.svg'),
          label: 'Views',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Views()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/opacity-24px.svg'),
          label: 'Water fill station',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WaterFillStation()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/ev_station-24px.svg'),
          label: 'EV charge station',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EVChargeStation()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/explore-24px.svg'),
          label: 'School Tour',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EVChargeStation()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
      ],
    );
  }

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
              markers: Set.from(diningHallList),
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

                          MaterialPageRoute(builder: (context) => slugMapFilter()),

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
      floatingActionButton: buildSpeedDial(),
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
                  "https://lh5.googleusercontent.com/p/AF1QipP5mognyo-FvIKU1jNOFGC0eLwkIuAkipfzb36s=w408-h544-k-no",
                  36.99169329799685, -122.06539542111443,"Rachel Carson/Oakes Dining Hall", '6 College Eight Service Rd, Santa Cruz, CA 95064'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOeA9tRpkXqf0nm4X_YFgjVcwmMioO2Io740htB=w408-h306-k-no",
                  36.99431757933324, -122.06594174458701,"Porter/Kresge Dining Hall", '411 Porter-Kresge Rd, Santa Cruz, CA 95064'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipP7b_BEmtJi91lrU0F4EGsVftZ3BBHhpNT6rEAo=w195-h120-p-k-no",
                  36.99684124370638, -122.05303038435036,"Cowell/Stevenson Dining Hall", "520 Cowell-Stevenson Road, Santa Cruz, CA 95064"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipNLSLmQqoAyuea_WjikR0qF8F19Y-XJPXk1_Gzh=w426-h240-k-no",
                  37.00014429303811, -122.05440605538377,"Crown/Merrill Dining Hall", '630 Crown Rd, Santa Cruz, CA 95064'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOLytcXhHeO9EOe-2jWmShft0l2u58T0ayW0mFp=w408-h306-k-no",
                  37.00074493904557, -122.05776568771819,"Colleges 9 & 10 Dining Hall", "McLaughlin Dr, Santa Cruz, CA 95064"),
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
