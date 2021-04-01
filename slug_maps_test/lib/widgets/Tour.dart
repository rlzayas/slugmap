import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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

class Tour extends StatefulWidget {
  Tour({Key key}) : super(key: key);
  @override
  _TourState createState() => _TourState();
}

class _TourState extends State<Tour> {

  Set<Marker> TourList = {

    //east remote
    Marker(
      markerId: MarkerId('EastRemoteParkingLot'),
      position: LatLng(36.99203741631251, -122.05312085074124),
      infoWindow: InfoWindow(
        title: '1: East Remote Parking Lot',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Opers field
    Marker(
      markerId: MarkerId('OPERS field'),
      position: LatLng(36.992914, -122.052347),
      infoWindow: InfoWindow(
        title: '2: OPERS field',
        snippet: 'Santa Cruz, CA 95064',

      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Stevenson College
    Marker(
      markerId: MarkerId('StevensonCollege'),
      position: LatLng(36.99718747230962, -122.0519119377878),
      infoWindow: InfoWindow(
        title: '3: Stevenson College',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Cowell College
    Marker(
      markerId: MarkerId('CowellCollege'),
      position: LatLng(36.99737038347433, -122.05427346220672),
      infoWindow: InfoWindow(
        title: '4: Cowell College',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),



    // Quarry plaza
    Marker(
      markerId: MarkerId('QuarryPlaza'),
      position: LatLng(36.997645, -122.055714),
      infoWindow: InfoWindow(
        title: '5: Quarry Plaza',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    //Crown College
    Marker(
      markerId: MarkerId('CrownCollege'),
      position: LatLng(37.00044004525279, -122.05452639437944),
      infoWindow: InfoWindow(
        title: '6: Crown College',
        snippet: '628 Crown Rd, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Merrill College
    Marker(
      markerId: MarkerId('MerrillCollege'),
      position: LatLng(36.99996850267072, -122.05330945824518),
      infoWindow: InfoWindow(
        title: '7: Merrill College',
        snippet: '641 Merrill Rd, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // College 9/10
    Marker(
      markerId: MarkerId('College10'),
      position: LatLng(37.00083458438215, -122.05857488511316),
      infoWindow: InfoWindow(
        title: '8: College 9/10',
        snippet: '710 College Ten Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Jack baskin engineering
    Marker(
      markerId: MarkerId('JackBaskin'),
      position: LatLng(37.000653, -122.062137),
      infoWindow: InfoWindow(
        title: '9: Jack Baskin Engineering Buildings',
        snippet: 'Parking Lot 139, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),
    // Porter College
    Marker(
      markerId: MarkerId('PhysialSci'),
      position: LatLng(36.999741, -122.061455),
      infoWindow: InfoWindow(
        title: '10: Physical Science Buildings',
        snippet: '1156 High Street, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Science & Engineering Library
    Marker(
      markerId: MarkerId('Science&EngineeringLibrary'),
      position: LatLng(36.99910517369182, -122.06059399782959),
      infoWindow: InfoWindow(
        title: '11: Science & Engineering Library',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Kresge College
    Marker(
      markerId: MarkerId('KresgeCollege'),
      position: LatLng(36.99765919789214, -122.06676649796817),
      infoWindow: InfoWindow(
        title: '12: Kresge College',
        snippet: '510 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Porter College
    Marker(
      markerId: MarkerId('PorterCollege'),
      position: LatLng(36.99460980922041, -122.0653309811971),
      infoWindow: InfoWindow(
        title: '13: Porter College',
        snippet: '1156 High Street, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // RCC College
    Marker(
      markerId: MarkerId('RachelCarsonCollege'),
      position: LatLng(36.99151711141353, -122.0647350052343),
      infoWindow: InfoWindow(
        title: '14: Rachel Carson College',
        snippet: '356 Rachel Carson Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Oaks College
    Marker(
      markerId: MarkerId('OaksCollege'),
      position: LatLng(36.989929657499914, -122.06277255820748),
      infoWindow: InfoWindow(
        title: '15: Oakes College',
        snippet: '231 Oakes Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // McHenry Library
    Marker(
      markerId: MarkerId('McHenryLibrary'),
      position: LatLng(36.99578136536548, -122.05888865898311),
      infoWindow: InfoWindow(
        title: '16: McHenry Library',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),




  };

  ///GoogleMapController mapController;
  GoogleMapController newMapController;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(36.989043, -122.058611);
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    locatePosition();
    _setPolyLines();

  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    newMapController = controller;
    locatePosition();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }


  //Current location of the user
  Position _currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async
  {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latLngPosition, zoom: 14.35);
    newMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }


  // For holding Co-ordinates as LatLng
  final List<LatLng> polyCords = [];

  //For holding instance of Polyline
   Set<Polyline> polyLineSet = {};

  void _setPolyLines() {

  }




  //Visibility for our screen for speed dial
  bool _visible = true;
  void setDialVisible(bool value) {
    setState(() {
      _visible = value;
    });
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
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              tiltGesturesEnabled: true,
              markers: TourList != null ? Set<Marker>.from(TourList) : null,
              polylines: polyLineSet,
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

            //Go back button
            Container(
              margin: EdgeInsets.only(
                  left: phoneWidth * .05866666667,
                  top: phoneHeight * .05911330049),
              width: phoneWidth * .08,
              height: phoneHeight * .03694581281,
              child: Stack(
                children: <Widget> [
                  FloatingActionButton(
                      backgroundColor: Color(0xffececec),
                      elevation: 0,
                      child: SvgPicture.asset('assets/images/Go_back.svg',),
                      onPressed:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => slugMapMain()),
                        );
                      }
                  ),

                ],


              ),
            ),
            _buildContainer(),
          ],
        ),
      ),
      floatingActionButton: buildSpeedDial(context, phoneWidth, phoneHeight, _visible),
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
            //east remote
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sustainability.ucsc.edu/initiatives/images/ucsc-solar.png",
                  36.99203741631251, -122.05312085074124, "1: East Remote Parking Lot",
                  "Parking lot to start at."),
            ),

            //Opers
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://denelecampbell.files.wordpress.com/2014/10/ucsc-view.jpg",
                  36.992914, -122.052347,"2: OPERS field", 'Open field space for yoga, sports, or simply enjoying the view' ),
            ),

            //Stevenson College
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMtC02MHqc4aC94j8QD5go2KnmDxSfS6-MPFUBW=w408-h240-k-no-pi-10-ya114.99999-ro-0-fo100",
                  36.99718747230962, -122.0519119377878,"3: Stevenson College", '1156 High St, Santa Cruz, CA 95064'),
            ),

            //Cowell
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipNhx5Qwz4qrEcYLREogVSdL-MDV6G4mu_G5AkJy=w426-h240-k-no",
                  36.99737038347433, -122.05427346220672,"4: Cowell College", '1156 High St, Santa Cruz, CA 95064'),
            ),

            //Quarry
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOuSZSryjYuT-8vlK_HuCUCmdSCQ6wLFSRPnHLO=w408-h306-k-no",
                  36.99996850267072, -122.05330945824518,"5: Quarry Plaza", '1156 High St, Santa Cruz, CA 95064'),
            ),

            //Cowell College
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOIyhMhB0GE98kK-JGb--1uRW3QmK85sV424u1r=w408-h306-k-no",
                  37.00044004525279, -122.05452639437944,"6: Crown College", "628 Crown Rd, Santa Cruz, CA 95064"),
            ),

            //Merril
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOuSZSryjYuT-8vlK_HuCUCmdSCQ6wLFSRPnHLO=w408-h306-k-no",
                  36.99996850267072, -122.05330945824518,"7: Merrill College", '641 Merrill Rd, Santa Cruz, CA 95064'),
            ),

            //College 9/10
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPowPyR7t_8kEB9eR9SQfKPNLoYBfPYyVNQZk9j=w426-h240-k-no",
                  37.00173913642322, -122.05729768589005,"8: College 9/10", "702 College Nine Rd, Santa Cruz, CA 95064"),
            ),

            //Jack Baskin
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/BaskEng1Eng2Plza.JPG/400px-BaskEng1Eng2Plza.JPG",
                  37.000653, -122.062137,"9: Jack Baskin Engineering", '1156 High Street, Santa Cruz, CA 95064'),
            ),

            //Physical Sceince buildings
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/BaskEng1Eng2Plza.JPG/400px-BaskEng1Eng2Plza.JPG",
                  36.999741, -122.06145,"10: Physical Science Buildings", '1156 High Street, Santa Cruz, CA 95064'),
            ),

            //S and E
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMZDLGPVvuBNpFWzfSRk2ipI2r0ez7bZlfZkG2l=w738-h240-k-no",
                  36.99910517369182, -122.06059399782959,"11: Science & Engineering Library", ""),
            ),

            //Kresge
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipNaGnwbY3Wq15t3GCBMSXQN1LbwcRz6eTTSxTh4=w408-h544-k-no",
                  36.99765919789214, -122.06676649796817,"12: Kresge College", "510 Porter-Kresge Rd, Santa Cruz, CA 95064"),
            ),

            //Porter
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPcPLt9ti9OeoGksu22-qZE0IKlfT_Y29BTeysC=w408-h306-k-no",
                  36.99460980922041, -122.06533098119717,"13: Porter College", '1156 High Street, Santa Cruz, CA 95064'),
            ),

            //RC
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3r2y6WU1uLFQTgCZAAEXdbNBMQQIGUZsa3yvc=w408-h240-k-no-pi-20-ya123-ro0-fo100",
                  36.99151711141353, -122.0647350052343,"Rachel Carson College", '356 Rachel Carson Rd, Santa Cruz, CA 95064'),
            ),

            //Oaks College
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOLheqUoXkrxh7dCib6JHR6m2D7zjmjSCMvI9tu=w408-h240-k-no-pi-0-ya88-ro-0-fo100",
                  36.989929657499914, -122.06277255820748,"Oakes College", '231 Oakes Rd, Santa Cruz, CA 95064'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipN_mpikHGXgPU5572_4u_4GjBl5HVED6eFeAAmE=w742-h240-k-no",
                  36.99578136536548, -122.05888865898311,"McHenry Library", 'Last Stop on the tour!'),
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

  // Future<void> getPlaceDirection() async
  // {
  //   var initialPos = Provider.of<AppData>(context, listen: false).pickuplocation;
  //   var finalPos = Provider.of<AppData>(context, listen: false).pickuplocation;
  //
  //   var startLatLng = LatLng(initialPos.latitude, finalPos.longitude);
  //   var destLatLng = LatLng(initialPos.latitude, finalPos.longitude);
  //
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => ProgressDialog(message: "Loading...",)
  //   );
  //   var details = await AssitMethods.obtainPlaceDirectionDetails(pickUpLatLng, dropOffLatLng);
  //
  //   Navigator.pop(context);
  //
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   List<PointLatLng> decodedPolyLinePointsResult = polylinePoints.decodePolyline(details.encodedPoints);
  //
  //   polyCords.clear();
  //
  //   if(decodedPolyLinePointsResult.isNotEmpty)
  //     {
  //       decodedPolyLinePointsResult.forEach((PointLatLng pointLatLng) {
  //         polyCords.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
  //       });
  //     }
  //
  //   polyLineSet.clear();
  //
  //   setState(() {
  //     Polyline polyline = Polyline(
  //       color: Colors.tealAccent,
  //       polylineId: PolylineId("PolylineID"),
  //       jointType: JointType.round,
  //       points: polyCords,
  //       width: 6,
  //       startCap: Cap.roundCap,
  //       endCap: Cap.roundCap,
  //       geodesic: true,
  //     );
  //
  //     polyLineSet.add(polyline);
  //   });
  // }

}

//  // For holding Co-ordinates as LatLng
//   final List<LatLng> polyCords = [];
//
//   //For holding instance of Polyline
//    Set<Polyline> polyLines = {};