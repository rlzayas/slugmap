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

class Colleges extends StatefulWidget {
  @override
  _CollegesState createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
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

  List<Marker> collegesList = [
    // Cowell College
    Marker(
      markerId: MarkerId('CowellCollege'),
      position: LatLng(36.99737038347433, -122.05427346220672),
      infoWindow: InfoWindow(
        title: 'Cowell College',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Stevenson College
    Marker(
      markerId: MarkerId('StevensonCollege'),
      position: LatLng(36.99718747230962, -122.0519119377878),
      infoWindow: InfoWindow(
        title: 'Stevenson College',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    //Crown College
    Marker(
      markerId: MarkerId('CrownCollege'),
      position: LatLng(37.00044004525279, -122.05452639437944),
      infoWindow: InfoWindow(
        title: 'Crown College',
        snippet: '628 Crown Rd, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Merrill College
    Marker(
      markerId: MarkerId('MerrillCollege'),
      position: LatLng(36.99996850267072, -122.05330945824518),
      infoWindow: InfoWindow(
        title: 'Merrill College',
        snippet: '641 Merrill Rd, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Porter College
    Marker(
      markerId: MarkerId('PorterCollege'),
      position: LatLng(36.99460980922041, -122.0653309811971),
      infoWindow: InfoWindow(
        title: 'Porter College',
        snippet: '1156 High Street, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Kresge College
    Marker(
      markerId: MarkerId('KresgeCollege'),
      position: LatLng(36.99765919789214, -122.06676649796817),
      infoWindow: InfoWindow(
        title: 'Kresge College',
        snippet: '510 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Oaks College
    Marker(
      markerId: MarkerId('OaksCollege'),
      position: LatLng(36.989929657499914, -122.06277255820748),
      infoWindow: InfoWindow(
        title: 'Oakes College',
        snippet: '231 Oakes Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // RCC College
    Marker(
      markerId: MarkerId('RachelCarsonCollege'),
      position: LatLng(36.99151711141353, -122.0647350052343),
      infoWindow: InfoWindow(
        title: 'Rachel Carson College',
        snippet: '356 Rachel Carson Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // College 9
    Marker(
      markerId: MarkerId('College9'),
      position: LatLng(37.00173913642322, -122.05729768589005),
      infoWindow: InfoWindow(
        title: 'College 9',
        snippet: '702 College Nine Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // College 10
    Marker(
      markerId: MarkerId('College10'),
      position: LatLng(37.00083458438215, -122.05857488511316),
      infoWindow: InfoWindow(
        title: 'College 10',
        snippet: '710 College Ten Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),
  ];

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
              markers: Set.from(collegesList),
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
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipNhx5Qwz4qrEcYLREogVSdL-MDV6G4mu_G5AkJy=w426-h240-k-no",
                  36.99737038347433, -122.05427346220672,"Cowell College", '1156 High St, Santa Cruz, CA 95064'),
            ),

            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMtC02MHqc4aC94j8QD5go2KnmDxSfS6-MPFUBW=w408-h240-k-no-pi-10-ya114.99999-ro-0-fo100",
                  36.99718747230962, -122.0519119377878,"Stevenson College", '1156 High St, Santa Cruz, CA 95064'),
            ),

            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOIyhMhB0GE98kK-JGb--1uRW3QmK85sV424u1r=w408-h306-k-no",
                  37.00044004525279, -122.05452639437944,"Crown College", "628 Crown Rd, Santa Cruz, CA 95064"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOuSZSryjYuT-8vlK_HuCUCmdSCQ6wLFSRPnHLO=w408-h306-k-no",
                  36.99996850267072, -122.05330945824518,"Merrill College", '641 Merrill Rd, Santa Cruz, CA 95064'),
            ),

            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPcPLt9ti9OeoGksu22-qZE0IKlfT_Y29BTeysC=w408-h306-k-no",
                  36.99460980922041, -122.06533098119717,"Porter College", '1156 High Street, Santa Cruz, CA 95064'),
            ),

            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipNaGnwbY3Wq15t3GCBMSXQN1LbwcRz6eTTSxTh4=w408-h544-k-no",
                  36.99765919789214, -122.06676649796817,"Kresge College", "510 Porter-Kresge Rd, Santa Cruz, CA 95064"),
            ),
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
                  "https://lh5.googleusercontent.com/p/AF1QipO3r2y6WU1uLFQTgCZAAEXdbNBMQQIGUZsa3yvc=w408-h240-k-no-pi-20-ya123-ro0-fo100",
                  36.99151711141353, -122.0647350052343,"Rachel Carson College", '356 Rachel Carson Rd, Santa Cruz, CA 95064'),
            ),

            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPowPyR7t_8kEB9eR9SQfKPNLoYBfPYyVNQZk9j=w426-h240-k-no",
                  37.00173913642322, -122.05729768589005,"College 9", "702 College Nine Rd, Santa Cruz, CA 95064"),
            ),SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOhtB5Na-a36jWl3vxJ1DwTRqFo4mLLQxKu9Vj6=w408-h544-k-no",
                  37.00083458438215, -122.05857488511316,"College 10", '710 College Ten Rd, Santa Cruz, CA 95064'),
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
