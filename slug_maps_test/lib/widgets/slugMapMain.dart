import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:testing_app/widgets/CollegesFilter.dart';
import 'package:testing_app/widgets/evFilterMap.dart';
import 'package:testing_app/widgets/evFilterPage.dart';
import 'package:testing_app/widgets/evPage.dart';
import 'package:testing_app/widgets/evScreen.dart';


import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';




class slugMapMain extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<slugMapMain> {
  //GoogleMapController mapController;
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
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this.setCustomMarker(); //remove this.
  }

  // void setCustomMarker() async {
  //   CollegesIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.0),
  //       'assets/marker_icons/College.svg'
  //   );
  //   DiningHallIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.0),
  //       'assets/marker_icons/Dining Hall.svg'
  //   );
  //   ParkingIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.0),
  //       'assets/marker_icons/Parking.svg'
  //   );
  //   EVStationIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.0),
  //       'assets/marker_icons/EV Station.svg'
  //   );
  //   WaterStationIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.0),
  //       'assets/marker_icons/Water Station.svg'
  //   );
  // };

  @override
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

    List<Marker> DiningHallList = [
      Marker(
        markerId: MarkerId('9&10DH'),
        position: LatLng(37.00074493904557, -122.05776568771819),
        infoWindow: InfoWindow(
          title: 'Colleges 9 & 10 Dining Hall',
          snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: MarkerId('CrownMerrillDH'),
        position: LatLng(37.00014429303811, -122.05440605538377),
        infoWindow: InfoWindow(
          title: 'Crown/Merrill Dining Hall',
          snippet: '630 Crown Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: MarkerId('CowellStevensonDH'),
        position: LatLng(36.99684124370638, -122.05303038435036),
        infoWindow: InfoWindow(
          title: 'Cowell/Stevenson Dining Hall',
          snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: MarkerId('PorterKresgeDH'),
        position: LatLng(36.99431757933324, -122.06594174458701),
        infoWindow: InfoWindow(
          title: 'Porter/Kresge Dining Hall',
          snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: MarkerId('RCCOaksDH'),
        position: LatLng(36.99169329799685, -122.06539542111443),
        infoWindow: InfoWindow(
          title: 'Rachel Carson/Oaks Dining Hall',
          snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    ];

    List<Marker> EVChargeStationList = [
      Marker(
        markerId: MarkerId('OceanST'),
        position: LatLng(36.9788943336269, -122.0223634179128),
        infoWindow: InfoWindow(
          title: 'EV ChargePoint Charging Station',
          snippet: '701 Ocean St, Santa Cruz, CA 95060',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      Marker(
        markerId: MarkerId('McLaughlinDr'),
        position: LatLng(36.999324250111506, -122.0632982467481),
        infoWindow: InfoWindow(
          title: 'EV ChargePoint Charging Station',
          snippet: ' McLaughlin Dr, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      Marker(
        markerId: MarkerId('Soquel Ave'),
        position: LatLng(36.98174810947192, -122.01507687519172),
        infoWindow: InfoWindow(
          title: 'EV ChargePoint Charging Station',
          snippet: '911 Soquel Ave, Santa Cruz, CA 95062',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
    ];

    List<Marker> WaterStationList = [
      Marker(
        markerId: MarkerId('ClassroomUnit'),
        position: LatLng(36.99803687001237, -122.05683525820898),
        infoWindow: InfoWindow(
          title: 'ClassroomUnit',
          //snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: MarkerId('ScienceHill'),
        position: LatLng(36.99786721918895, -122.05834495838793),
        infoWindow: InfoWindow(
          title: 'Science Hill',
          //snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: MarkerId('QuarryPlaza'),
        position: LatLng(36.99811991616817, -122.05571328710818),
        infoWindow: InfoWindow(
          title: 'BayTree Bookstore/Quarry Plaza',
          //snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: MarkerId('McHenry'),
        position: LatLng(36.99578136536548, -122.05888865898311),
        infoWindow: InfoWindow(
          title: 'McHenry Library',
          snippet: '1156 High St, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: MarkerId('MediaTheater'),
        position: LatLng(36.99525351792488, -122.06164320692419),
        infoWindow: InfoWindow(
          title: 'Media Theater',
          snippet: '453 Kerr Rd, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: MarkerId('Earth&Marine'),
        position: LatLng(36.99819000796422, -122.05963315215398),
        infoWindow: InfoWindow(
          title: 'Earth & Marine Sciences Building',
          // snippet: 'Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: MarkerId('OPERS'),
        position: LatLng(36.99483333081348, -122.05406975033789),
        infoWindow: InfoWindow(
          title: 'OPERS Upper East Field',
          // snippet: 'Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
      Marker(
        markerId: MarkerId('BSOE'),
        position: LatLng(37.00058470510099, -122.06325024650194),
        infoWindow: InfoWindow(
          title: 'Jack Baskin Engineering',
          snippet: '1156 High St, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
    ];


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
              margin: EdgeInsets.only(
                top: phoneHeight * .06650246305,
                left: phoneWidth * .8693333333),
              child: Stack(
                children: <Widget>[
                  FloatingActionButton(
                      backgroundColor: Color(0xffececec),
                      elevation: 0,
                      child: SvgPicture.asset('assets/images/Filter_menu.svg',),

                      onPressed: () {
                        Navigator.push(
                          context,
                          // showPinsOnMap(),
<<<<<<< HEAD
                             MaterialPageRoute(builder: (context) => slugMapFilter()),);
                          // MaterialPageRoute(builder: (context) => Colleges()),
                          // MaterialPageRoute(builder: (context) => DiningHalls()),
                          // MaterialPageRoute(builder: (context) => EVChargeStation()),
                          // MaterialPageRoute(builder: (context) => WaterFillStation()),
                          // MaterialPageRoute(builder: (context) => Views()),
=======
                          // MaterialPageRoute(builder: (context) => CollegesFilter()),
                          // MaterialPageRoute(builder: (context) => EVFilterMap()),
                          MaterialPageRoute(builder: (context) => EVFilterPage()),
                          // MaterialPageRoute(builder: (context) => EVMap()),
                          // MaterialPageRoute(builder: (context) => EVScreen()),
>>>>>>> parent of 5c06415 (Merge branch 'Abhi' into Test)
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
          ],
        ),
      ),
    ); //812 x 375
  }
}

