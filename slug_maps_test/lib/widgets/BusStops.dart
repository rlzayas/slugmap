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

class BusStops extends StatefulWidget {
  @override
  _BusStopsState createState() => _BusStopsState();
}

class _BusStopsState extends State<BusStops> {
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

  List<Marker> busStopsList = [
    // Crown Merrill Apartments
    Marker(
      markerId: MarkerId('CrownMerrillApartments'),
      position: LatLng(37.00233042537575, -122.05514425728445),
      infoWindow: InfoWindow(
        title: 'Crown Merrill Apartments',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Crown College
    Marker(
      markerId: MarkerId('CrownCollegeStop'),
      position: LatLng(37.000633900624976, -122.0547259697124),
      infoWindow: InfoWindow(
        title: 'Crown College',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // McLaughlin Dr Crown & Merrill
    Marker(
      markerId: MarkerId('McLaughlinCrownMerrill'),
      position: LatLng(36.99916009310121, -122.05526242543144),
      infoWindow: InfoWindow(
        title: 'McLaughlin Dr - Crown & Merrill',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // McLaughlin Dr College 9 & 10
    Marker(
      markerId: MarkerId('McLaughlin9&10'),
      position: LatLng(37.000111176968524, -122.05834161731674),
      infoWindow: InfoWindow(
        title: 'McLaughlin Dr - College 9 & 10',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Hagar Dr Bookstore Cowell & Stevenson
    Marker(
      markerId: MarkerId('HagarDrBookstoreCowellStevenson'),
      position: LatLng(36.99759205669758, -122.05506932708317),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - Bookstore Cowell & Stevenson',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // College 9 & 10 - Health Ctr
    Marker(
      markerId: MarkerId('College9&10HealthCtr'),
      position: LatLng(36.999819851908974, -122.05836306140019),
      infoWindow: InfoWindow(
        title: 'College 9 & 10 - Health Ctr',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Quarry Plaza
    Marker(
      markerId: MarkerId('QuarryPlaza'),
      position: LatLng(36.997550441702685, -122.05559345078998),
      infoWindow: InfoWindow(
        title: 'Quarry Plaza',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // McHenry Library
    Marker(
      markerId: MarkerId('McHenryLibrary'),
      position: LatLng(36.99662498686069, -122.05872747625124),
      infoWindow: InfoWindow(
        title: 'McHenry Library',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Hagar Dr - Bookstore, Cowell & Stevenson
    Marker(
      markerId: MarkerId('HagarDrBookstoreCowellStevenson2'),
      position: LatLng(36.99673078123862, -122.05542792797192),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - Bookstore, Cowell & Stevenson',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Cowell College
    Marker(
      markerId: MarkerId('CowellCollegeStop'),
      position: LatLng(36.997656186652065, -122.05316566865447),
      infoWindow: InfoWindow(
        title: 'Cowell College',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Stevenson College
    Marker(
      markerId: MarkerId('StevensonCollegeStop'),
      position: LatLng(36.997726688461306, -122.05195179562119),
      infoWindow: InfoWindow(
        title: 'Stevenson College',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // East Field House
    Marker(
      markerId: MarkerId('EastFieldHouse'),
      position: LatLng(36.994357248831975, -122.05555567118188),
      infoWindow: InfoWindow(
        title: 'East Field House',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // East Remote Lot Interior
    Marker(
      markerId: MarkerId('EastRemoteLotInterior'),
      position: LatLng(36.99083982740803, -122.05214599406385),
      infoWindow: InfoWindow(
        title: 'East Remote Lot Interior',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Hagar Dr - East Remote Parking
    Marker(
      markerId: MarkerId('HagarDrEastRemoteParking'),
      position: LatLng(36.99143835860411, -122.05467777622509),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - East Remote Parking',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Hagar Dr - East Remote Parking 2
    Marker(
      markerId: MarkerId('HagarDrEastRemoteParking2'),
      position: LatLng(36.99132284464544, -122.05493213962976),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - East Remote Parking',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Hagar Dr & Village Rd
    Marker(
      markerId: MarkerId('HagarDr&VillageRd'),
      position: LatLng(36.98611771147566, -122.053570734405),
      infoWindow: InfoWindow(
        title: 'Hagar Dr & Village Rd',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Hagar Dr & Village Rd 2
    Marker(
      markerId: MarkerId('HagarDr&VillageRd2'),
      position: LatLng(36.985659456324726, -122.05360260590832),
      infoWindow: InfoWindow(
        title: 'Hagar Dr & Village Rd',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Sciences Hill
    Marker(
      markerId: MarkerId('SciencesHill'),
      position: LatLng(36.99999517999754, -122.06239580451114),
      infoWindow: InfoWindow(
        title: 'Sciences Hill',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Science Hill
    Marker(
      markerId: MarkerId('ScienceHill'),
      position: LatLng(36.99998015013614, -122.06210014694774),
      infoWindow: InfoWindow(
        title: 'Science Hill',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Kresge
    Marker(
      markerId: MarkerId('Kresge'),
      position: LatLng(36.999405465723854, -122.06458358781089),
      infoWindow: InfoWindow(
        title: 'Kresge',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Heller Dr - MacLaughlin Dr
    Marker(
      markerId: MarkerId('HellerDrMacLaughlinDr'),
      position: LatLng(36.99930624365153, -122.0643754201617),
      infoWindow: InfoWindow(
        title: 'Heller Dr - MacLaughlin Dr',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Thimann Labs
    Marker(
      markerId: MarkerId('ThimannLabs'),
      position: LatLng(36.99758050992469, -122.06186820419856),
      infoWindow: InfoWindow(
        title: 'Thimann Labs',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Kerr Hall
    Marker(
      markerId: MarkerId('KerHall'),
      position: LatLng(36.996460411746426, -122.06172636265032),
      infoWindow: InfoWindow(
        title: 'Kerr Hall',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Kerr Hall 2
    Marker(
      markerId: MarkerId('KerHall2'),
      position: LatLng(36.99687373686239, -122.06354222067843),
      infoWindow: InfoWindow(
        title: 'Kerr Hall',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Media Theater
    Marker(
      markerId: MarkerId('MediaTheater'),
      position: LatLng(36.995057927907524, -122.06147665236111),
      infoWindow: InfoWindow(
        title: 'Media Theater',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Recital Hall
    Marker(
      markerId: MarkerId('RecitalHall'),
      position: LatLng(36.993328278997105, -122.06108488372507),
      infoWindow: InfoWindow(
        title: 'Recital Hall',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Heller Dr - RCC & Porter
    Marker(
      markerId: MarkerId('Heller Dr - RCC & Porter'),
      position: LatLng(36.99314401014827, -122.06527673418728),
      infoWindow: InfoWindow(
        title: 'Heller Dr - Rachel Carson & Porter',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Heller Dr - RCC & Porter 2
    Marker(
      markerId: MarkerId('Heller Dr - RCC & Porter2'),
      position: LatLng(36.99287781889026, -122.06492693162627),
      infoWindow: InfoWindow(
        title: 'Heller Dr - Rachel Carson & Porter',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Family Student Housing
    Marker(
      markerId: MarkerId('FamilyStudentHousing'),
      position: LatLng(36.991927960465915, -122.06678385499028),
      infoWindow: InfoWindow(
        title: 'Family Student Housing',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Oakes College
    Marker(
      markerId: MarkerId('OaksCollegeStop'),
      position: LatLng(36.99081732602527, -122.06616193340405),
      infoWindow: InfoWindow(
        title: 'Oakes College',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // Oakes College 2
    Marker(
      markerId: MarkerId('OakesCollegeStop'),
      position: LatLng(36.990094987857034, -122.06727081180792),
      infoWindow: InfoWindow(
        title: 'Oakes College',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),

    // West Remote Lot
    Marker(
      markerId: MarkerId('WestRemoteRot'),
      position: LatLng(36.98880072878589, -122.06482455918103),
      infoWindow: InfoWindow(
        title: 'West Remote Lot',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    ),
  ];


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
              markers: Set.from(busStopsList),
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
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=JI-ii4HpJkJe8Qe4EdJ8jQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=245.87582&pitch=0&thumbfov=100",
                  36.98880072878589, -122.06482455918103,"West Remote Lot", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Y-ytr_mCRzQuukx8BQ4wDw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=357.60147&pitch=0&thumbfov=100",
                  36.990094987857034, -122.06727081180792,"Oakes College", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=s5iKd4vWvW08Pl3d7GoGyw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=73.114044&pitch=0&thumbfov=100",
                  36.99081732602527, -122.06616193340405,"Oakes College", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipN4a0cKBfTBKo6Y-ZqcmROrHjLXdgOWqPXMFHSJ=w408-h306-k-no",
                  36.991927960465915, -122.06678385499028,"Family Student Housing", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOOGjnx9_iK0BLhA6w6ji75ZjK_7g6hS2_nZ5pj=w408-h306-k-no",
                  36.99287781889026, -122.06492693162627,"Heller Dr - Rachel Carson & Porter", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPuUpnAd7gMTwb1fYkddp3iF1yyI7uNbElVxE9O=w408-h278-k-no",
                  36.99314401014827, -122.06527673418728,"Heller Dr - Rachel Carson & Porter", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=fqFDUlHxAWh-I40PqJqUPQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=44.243114&pitch=0&thumbfov=100",
                  36.993328278997105, -122.06108488372507,"Recital Hall", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=8z1efXHNo9fLwoyCcXY3QA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=24.267426&pitch=0&thumbfov=100",
                  36.995057927907524, -122.06147665236111,"Media Theater", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipN8Q3M8TG4IKeBJ4DIrH_Cpjsafj22K4m04StUl=w408-h544-k-no",
                  36.99687373686239, -122.06354222067843,"Kerr Hall", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=1zDvAj3GbJOappnladqjsg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=296.77664&pitch=0&thumbfov=100",
                  36.996460411746426, -122.06172636265032,"Kerr Hall", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=cQ29bqmgUN5DFQ-fzbmWOg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=86.94409&pitch=0&thumbfov=100",
                  36.99758050992469, -122.06186820419856,"Thimann Labs", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nkmUu03b6TRQt1Tx_RPmHQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=105.52248&pitch=0&thumbfov=100",
                  36.99930624365153, -122.0643754201617,"Heller Dr - MacLaughlin Dr", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nkmUu03b6TRQt1Tx_RPmHQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=304.8354&pitch=0&thumbfov=100",
                  36.999405465723854, -122.06458358781089,"Kresge", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMitcDDJGGTsFsfyQ1t8QBs3PxavsOc7GxHvd5I=w408-h306-k-no",
                  36.99998015013614, -122.06210014694774,"Science Hill", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=chd-yazcn9lIhGeB7u8pRQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=338.7489&pitch=0&thumbfov=100",
                  36.99999517999754, -122.06239580451114,"Sciences Hill", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=0WgzER3sRuTLcIg4gKASFg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=252.50029&pitch=0&thumbfov=100",
                  36.985659456324726, -122.05360260590832,"Hagar Dr & Village Rd", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=wWjJl1Xds-RdcpON5uQ9uQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=20.00979&pitch=0&thumbfov=100",
                  36.98611771147566, -122.053570734405,"Hagar Dr & Village Rd", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xgGTFeYrl1_4a8ZnKVZN-w&cb_client=search.gws-prod.gps&w=408&h=240&yaw=323.62112&pitch=0&thumbfov=100",
                  36.99083982740803, -122.05214599406385,"Hagar Dr - East Remote Parking", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=nrYx_HmX8FWjO8D2lGPjuQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=249.40878&pitch=0&thumbfov=100",
                  36.99132284464544, -122.05493213962976,"Hagar Dr - East Remote Parking", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=RW60RXmK92xLYOFRM-mG4A&cb_client=search.gws-prod.gps&w=408&h=240&yaw=28.494568&pitch=0&thumbfov=100",
                  36.99143835860411, -122.05467777622509,"Hagar Dr - East Remote Parking", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=2QW-heRHczQSJeNiAwpcJQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=45.4681&pitch=0&thumbfov=100",
                  36.994357248831975, -122.05555567118188,"East Field House", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=xuYAcdsV7yCATgpS3TlrXQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=132.44197&pitch=0&thumbfov=100",
                  36.997726688461306, -122.05195179562119,"Stevenson College", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipNXc3L4sgSK2ge4tup28iF3CxcQ8sdjnHzjUkur=w408-h240-k-no-pi-20-ya340-ro-0-fo100",
                  36.997656186652065, -122.05316566865447,"Cowell College", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMG5kVCZp7OsHWgbEGOMtgwa15lFRXLrEztFjZX=w408-h306-k-no",
                  36.99673078123862, -122.05542792797192,"Hagar Dr - Bookstore, Cowell & Stevenson", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPtp8tjul8akWv4dcVnst-3o65Q5CPB3Pt0Tawd=w408-h306-k-no",
                  36.99759205669758, -122.05506932708317,"Hagar Dr - Bookstore, Cowell & Stevenson", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=u3gp4mnfB9UYZ5pgqkLJJA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=203.7028&pitch=0&thumbfov=100",
                  36.99662498686069, -122.05872747625124,"McHenry Library", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo0.ggpht.com/maps/photothumb/fd/v1?bpb=ChEKD3NlYXJjaC5nd3MtcHJvZBIgChIJIenOLaFBjoAR-P1-_8grKFAqCg0AAAAAFQAAAAAaBgjwARCYAw&gl=US",
                  36.997550441702685, -122.05559345078998,"Quarry Plaza", ''),
            ),SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo0.ggpht.com/maps/photothumb/fd/v1?bpb=ChEKD3NlYXJjaC5nd3MtcHJvZBIsChIJ81nAgApBjoARkX5_VAnmeBkSCg1Pug0WFUtgP7cqCg34tg0WFTphP7caBgjwARCYAw&gl=US",
                  36.999819851908974, -122.05836306140019,"College 9 & 10 - Health Ctr", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=-JdMwdnf7tkucbkbHE7mtg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=298.38712&pitch=0&thumbfov=100",
                  37.000111176968524, -122.05834161731674,"McLaughlin Dr - College 9 & 10", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=BviDwl1a67yiOLkgcz_SMA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=73.50622&pitch=0&thumbfov=100",
                  36.99916009310121, -122.05526242543144,"McLaughlin Dr - Crown & Merill", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=t4SnokAWPBDa0VefaAqTTg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=298.86865&pitch=0&thumbfov=100",
                  37.000633900624976, -122.0547259697124,"Crown College", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=POyZ6zHmoCne9xncgLLh2A&cb_client=search.gws-prod.gps&w=408&h=240&yaw=122.84465&pitch=0&thumbfov=100",
                  37.00233042537575, -122.05514425728445,"Crown Merrill Apartments", ''),
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
