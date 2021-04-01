import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
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

class Views extends StatefulWidget {
  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
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

  List<Marker> viewsList = [
    // Cave Gulch
    Marker(
      markerId: MarkerId('C10Garden'),
      position: LatLng(37.000147, -122.057486),
      infoWindow: InfoWindow(
        title: 'College 10 Garden',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Cave Gulch
    Marker(
      markerId: MarkerId('CaveGulch'),
      position: LatLng(36.99403252521436, -122.0690402904878),
      infoWindow: InfoWindow(
        title: 'Cave Gulch',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

  // Stevenson Knoll Marker
    Marker(
        markerId: MarkerId('Stevenson Knoll'),
        position: LatLng(36.996041133200166, -122.05165615971505),
        infoWindow: InfoWindow(
          title: 'Stevenson Knoll',
          snippet: 'Casa Sexta, Santa Cruz, CA 95064',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Porter Squiggle Marker
    Marker(
      markerId: MarkerId('Porter Squiggle'),
      position: LatLng(36.99340877871167, -122.06515297320963),
      infoWindow: InfoWindow(
        title: 'Porter Squiggle',
        snippet: '200 Heller Dr, Santa Cruz, CA 95064',
      ),

      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Pogonip Vista Point Marker
    Marker(
      markerId: MarkerId('Pogonip Vista Point'),
      position: LatLng(36.99067567820772, -122.04909315971524),
      infoWindow: InfoWindow(
        title: 'Pogonip Vista Point',
        snippet: 'Santa Cruz, CA 95060',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Pogonip Historic Limekiln
    Marker(
      markerId: MarkerId('PogonipHistoricLimekiln'),
      position: LatLng(37.00130432638354, -122.04928003710356),
      infoWindow: InfoWindow(
        title: 'Pogonip Historic Limekiln',
        snippet: 'Lime Kiln Trail, Santa Cruz, CA 95060',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Pogonip
    Marker(
      markerId: MarkerId('Pogonip'),
      position: LatLng(36.99550145357614, -122.04428228370232),
      infoWindow: InfoWindow(
        title: 'Pogonip',
        snippet: '333 Golf Club Dr, Santa Cruz, CA 95060',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Buddha Statue
    Marker(
      markerId: MarkerId('BuddhaStatue'),
      position: LatLng(37.00660409811856, -122.06003603558892),
      infoWindow: InfoWindow(
        title: 'Buddha Statue',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Tree 9
    Marker(
      markerId: MarkerId('Tree9'),
      position: LatLng(37.004851356158554, -122.06020253899865),
      infoWindow: InfoWindow(
        title: 'Tree 9',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Garden of Eden
    Marker(
        markerId: MarkerId('GardenOfEden'),
        position: LatLng(37.024758967944, -122.0580458659901),
        infoWindow: InfoWindow(
          title: 'Garden of Eden',
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
              markers: Set.from(viewsList),
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
                  "https://scontent-lax3-1.xx.fbcdn.net/v/t1.18169-9/11141147_891237167581803_121545451108427757_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=9267fe&_nc_ohc=v7jLp4_ua40AX-YVjZ7&_nc_ht=scontent-lax3-1.xx&oh=d798ff4a1d65d6be170810ee351ff3ae&oe=608A55AD",
                  37.000147, -122.057486,"College 10 Garden", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMDxwJSE9UOylP6EmegE7yEQKsK_IB83YK9eGbx=w408-h739-k-no",
                  37.004851356158554, -122.06020253899865,"Tree 9", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMrKKlNI9IaQEmofFisCV5MfbD8GGqATEaWrrvb=w408-h306-k-no",
                  37.00660409811856, -122.06003603558892,"Buddha Statue", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMY6SXi_MN_NoW73V3G7-1oHV_K7hmHHH_QcJ_h=w408-h306-k-no",
                  37.024758967944, -122.0580458659901,"Garden of Eden - Henry Cowell Redwood State Park", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipP5uXSS6OVv5_qyHgNyrLR_A23Rs6aIq2-z4Cw=w408-h240-k-no-pi0-ya47.170418-ro0-fo100",
                  36.99067567820772, -122.04909315971524,"Pogonip Vista Point", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOIKefoiJJ8tjGT6XYzXOTV_ntuBmNy0_pfp_Y=w408-h306-k-no",
                  36.99550145357614, -122.04428228370232,"Pogonip", '333 Golf Club Dr, Santa Cruz, CA 95060'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOpm9lF4mlqHVtgekifhteeOYmtIraNj8l-KM2v=w408-h306-k-no",
                  37.00130432638354, -122.04928003710356,"Pogonip Historic Limekiln", 'Lime Kiln Trail, Santa Cruz, CA 95060'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPqN_Q-GAVRbGioHSPCHU1fqrthO-hoN2OEvlfS=w408-h306-k-no",
                  36.99340877871167, -122.06515297320963,"Porter Squiggle", "200 Heller Dr, Santa Cruz, CA 95064"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMWbGItmUxm723i7lxgGrdWV-utM1jHcatQMnmE=w408-h240-k-no-pi-0-ya155.2-ro-0-fo100",
                  36.996041133200166, -122.05165615971505,"Stevenson Knoll", "Casa Sexta, Santa Cruz, CA 95064"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMjeePUYmsJo-2hu2D6DL-bzd8IGLf0Tzd_wTzq=w408-h544-k-no",
                  36.99403252521436, -122.0690402904878,"Cave Gulch", ''),
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
