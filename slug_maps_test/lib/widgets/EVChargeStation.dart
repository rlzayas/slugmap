import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class EVChargeStation extends StatefulWidget {
  @override
  _EVChargeStationState createState() => _EVChargeStationState();
}

class _EVChargeStationState extends State<EVChargeStation> {

  //GoogleMapController mapController;
  GoogleMapController newMapController;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(36.989043, -122.058611);
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

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

  List<Marker> evStationList = [
    // EV  Charging Station 1 Marker
    Marker(
      markerId: MarkerId('OceanST'),
      position: LatLng(36.9788943336269, -122.0223634179128),
      infoWindow: InfoWindow(
        title: 'EV ChargePoint Charging Station',
        snippet: '701 Ocean St, Santa Cruz, CA 95060',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)
    ),

    // EV Charging Station 2 Marker
    Marker(
      markerId: MarkerId('McLaughlinDr'),
      position: LatLng(36.999324250111506, -122.0632982467481),
      infoWindow: InfoWindow(
        title: 'EV ChargePoint Charging Station',
        snippet: ' McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // EV Charging Station 3 Marker
    Marker(
      markerId: MarkerId('Soquel Ave'),
      position: LatLng(36.98174810947192, -122.01507687519172),
      infoWindow: InfoWindow(
        title: 'EV ChargePoint Charging Station',
        snippet: '911 Soquel Ave, Santa Cruz, CA 95062',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
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
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              markers: Set.from(evStationList),
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
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=TGL8DZ23ekiqSC7nusJavw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=162.83861&pitch=0&thumbfov=100",
                  36.98174810947192, -122.01507687519172,"EV ChargePoint Charging Station", '911 Soquel Ave, Santa Cruz, CA 95062'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=BRF4_H-Hm-xXX8Sj43dX2g&cb_client=search.gws-prod.gps&w=408&h=240&yaw=81.27395&pitch=0&thumbfov=100",
                  36.999324250111506, -122.0632982467481,"EV ChargePoint Charging Station", '701 Ocean St, Santa Cruz, CA 95060'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo0.ggpht.com/maps/photothumb/fd/v1?bpb=ChEKD3NlYXJjaC5nd3MtcHJvZBIgChIJicLjciRAjoARJnHB89Dp1H8qCg0AAAAAFQAAAAAaBgjwARCYAw&gl=US",
                  36.9788943336269, -122.0223634179128,"EV ChargePoint Charging Station", "701 Ocean St, Santa Cruz, CA 95060"),
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
