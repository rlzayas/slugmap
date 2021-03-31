import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:testing_app/widgets/Colleges.dart';
import 'package:testing_app/widgets/DiningHalls.dart';
import 'package:testing_app/widgets/EVChargeStation.dart';

import 'package:testing_app/widgets/FilterInMainTest.dart';

import 'package:testing_app/widgets/WaterFillStation.dart';
import 'package:testing_app/widgets/Views.dart';
import 'package:testing_app/widgets/HikingTrails.dart';
import 'package:testing_app/widgets/Libraries.dart';
import 'package:testing_app/widgets/Parking.dart';
import 'package:testing_app/widgets/BusStops.dart';

import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';
import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';
import 'package:testing_app/widgets/newTestMap.dart';

import 'slugMapFilter.dart';

class slugMapMain extends StatefulWidget {

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<slugMapMain> {

  GoogleMapController newMapController;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(36.989043, -122.058611);
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  Set<Marker> _markers = {}; // replace {} w/ Set<Marker>()?
  // BitmapDescriptor CollegesIcon;
  // BitmapDescriptor DiningHallIcon;
  // BitmapDescriptor LibrariesIcon;
  // BitmapDescriptor ParkingIcon;
  // BitmapDescriptor WaterStationIcon;
  // BitmapDescriptor EVStationIcon;

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    newMapController = controller;
    locatePosition();
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  //Current location of the user
  Position currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async
  {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

  @override
  Widget build(BuildContext context) {
    //phone dimensions
    double phoneWidth = MediaQuery.of(context).size.width; //375
    double phoneHeight = MediaQuery.of(context).size.height; //812

    List<Marker> CollegesList = [
      Marker(
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
      Marker(
        markerId: MarkerId('StevensonCollege'),
        position: LatLng(36.99718747230962, -122.0519119377878),
        infoWindow: InfoWindow(
          title: 'Stevenson College',
          snippet: '1156 High St, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('CrownCollege'),
        position: LatLng(37.00044004525279, -122.05452639437944),
        infoWindow: InfoWindow(
          title: 'Crown College',
          snippet: '628 Crown Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('MerrillCollege'),
        position: LatLng(36.99996850267072, -122.05330945824518),
        infoWindow: InfoWindow(
          title: 'Merrill College',
          snippet: '641 Merrill Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('PorterCollege'),
        position: LatLng(36.99460980922041, -122.0653309811971),
        infoWindow: InfoWindow(
          title: 'Porter College',
          snippet: '1156 High Street, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('KresgeCollege'),
        position: LatLng(36.99765919789214, -122.06676649796817),
        infoWindow: InfoWindow(
          title: 'Kresge College',
          snippet: '510 Porter-Kresge Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('OaksCollege'),
        position: LatLng(36.989929657499914, -122.06277255820748),
        infoWindow: InfoWindow(
          title: 'Oaks College',
          snippet: '231 Oakes Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('RachelCarsonCollege'),
        position: LatLng(36.99151711141353, -122.0647350052343),
        infoWindow: InfoWindow(
          title: 'Rachel Carson College',
          snippet: '356 Rachel Carson Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('College9'),
        position: LatLng(37.00173913642322, -122.05729768589005),
        infoWindow: InfoWindow(
          title: 'College 9',
          snippet: '702 College Nine Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('College10'),
        position: LatLng(37.00083458438215, -122.05857488511316),
        infoWindow: InfoWindow(
          title: 'College 10',
          snippet: '710 College Ten Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    ];
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latLngPosition, zoom: 14.35);
    newMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }


  //Visibility for our screen for speed dial
  bool _visible = true;
  void setDialVisible(bool value) {
    setState(() {
      _visible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //phone dimensions
    double phoneWidth = MediaQuery.of(context).size.width; //375
    double phoneHeight = MediaQuery.of(context).size.height; //812

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
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,


            ),

            //Container 2: Full Search bar container
            Container(
              margin: EdgeInsets.only(
                  top: phoneHeight * .05665024631, left: phoneWidth * .048),
//<<<<<<< Updated upstream

//=======
//>>>>>>> Stashed changes
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
                    MaterialPageRoute(builder: (context) => slugSearch()),
                  );
                },
              ),
            ),

            //
            //The filter button *****************************************
            //
            Container(
              height: phoneHeight * .02463054187,
              width: phoneWidth * .05866666667,
              margin: EdgeInsets.only(
//<<<<<<< Updated upstream
                  top: phoneHeight * .06650246305,
                  left: phoneWidth * .8693333333),

//>>>>>>> Stashed changes
              child: Stack(
                children: <Widget>[
                  FloatingActionButton(
                      backgroundColor: Color(0xffececec),
                      elevation: 0,
                      child: SvgPicture.asset(
                        'assets/images/Filter_menu.svg',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => slugMapFilter()),
                          // showPinsOnMap(),
//<<<<<<< Updated upstream
                          // MaterialPageRoute(builder: (context) => Colleges()),
                          // MaterialPageRoute(builder: (context) => DiningHalls()),
                          // MaterialPageRoute(builder: (context) => EVChargeStation()),
                          // MaterialPageRoute(builder: (context) => WaterFillStation()),
                          // MaterialPageRoute(builder: (context) => Views()),
//=======
                          // MaterialPageRoute(builder: (context) => CollegesFilter()),
                          // MaterialPageRoute(builder: (context) => EVFilterMap()),
                          // MaterialPageRoute(
                          //     builder: (context) => EVFilterPage()),
                          // MaterialPageRoute(builder: (context) => EVMap()),
                          // MaterialPageRoute(builder: (context) => EVScreen()),
//>>>>>>> Stashed changes
                        );
                      })
                ],
              ),
            ),

          //Slug logo in the top left ****************************************
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
          ],
        ),

      ),
      floatingActionButton: buildSpeedDial(context, phoneWidth, phoneHeight, _visible),
    ); //812 x 375
  }
}
//<<<<<<< Updated upstream

//=======
//>>>>>>> Stashed changes
