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

class WaterFillStation extends StatefulWidget {
  @override
  _WaterFillStationState createState() => _WaterFillStationState();
}

class _WaterFillStationState extends State<WaterFillStation> {
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

  List<Marker> waterStationList = [
    // Classroom Unit
    Marker(
      markerId: MarkerId('ClassroomUnit'),
      position: LatLng(36.99803687001237, -122.05683525820898),
      infoWindow: InfoWindow(
        title: 'ClassroomUnit',
        //snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),

    // Science Hill
    Marker(
      markerId: MarkerId('ScienceHill'),
      position: LatLng(36.99786721918895, -122.05834495838793),
      infoWindow: InfoWindow(
        title: 'Science Hill',
        //snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),

    // Quarry Plaza
    Marker(
      markerId: MarkerId('QuarryPlaza'),
      position: LatLng(36.99811991616817, -122.05571328710818),
      infoWindow: InfoWindow(
        title: 'BayTree Bookstore/Quarry Plaza',
        //snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),

    //McHenry Library
    Marker(
      markerId: MarkerId('McHenry'),
      position: LatLng(36.99578136536548, -122.05888865898311),
      infoWindow: InfoWindow(
        title: 'McHenry Library',
        snippet: '1156 High St, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),

    // Media Theater
    Marker(
      markerId: MarkerId('MediaTheater'),
      position: LatLng(36.99525351792488, -122.06164320692419),
      infoWindow: InfoWindow(
        title: 'Media Theater',
        snippet: '453 Kerr Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),

    // Earth & Marine Sciences Building
    Marker(
      markerId: MarkerId('Earth&Marine'),
      position: LatLng(36.99819000796422, -122.05963315215398),
      infoWindow: InfoWindow(
        title: 'Earth & Marine Sciences Building',
        // snippet: 'Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),

    // Opers East Field House
    Marker(
      markerId: MarkerId('OPERS'),
      position: LatLng(36.99483333081348, -122.05406975033789),
      infoWindow: InfoWindow(
        title: 'OPERS Upper East Field House',
        // snippet: 'Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),

    //Jack baskin Engineering
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
              markers: Set.from(waterStationList),
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
                            MaterialPageRoute(builder: (context) => EVChargeStation()),

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
                  "https://lh5.googleusercontent.com/p/AF1QipP2UP9oSXso-rCQRJT5Pe2bwA0JElyu2NmzC9P6=w408-h544-k-no",
                  37.00058470510099, -122.06325024650194,"Jack Baskin Engineering", '1156 High St, Santa Cruz, CA 95064'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=Frk6TnKx7svE48zRH2D7Lw&cb_client=search.gws-prod.gps&w=408&h=240&yaw=251.20462&pitch=0&thumbfov=100",
                  36.99483333081348, -122.05406975033789,"OPERS Upper East Field House", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo1.ggpht.com/maps/photothumb/fd/v1?bpb=ChEKD3NlYXJjaC5nd3MtcHJvZBI0ChIJ7fWk97pBjoARx-jk7pyNJogaEgkd11MFyEGOgBFY0HEuz2iSTyoKDY44CxYVNwNAtxoGCPABEJgD&gl=US",
                  36.99819000796422, -122.05963315215398,"Earth & Marine Sciences Building", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPEff78cvzGuy8tZCBft1EUpjmadww73uT5kvnS=w408-h306-k-no",
                  36.99525351792488, -122.06164320692419,"Media Theater", '453 Kerr Rd, Santa Cruz, CA 95064'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipN_mpikHGXgPU5572_4u_4GjBl5HVED6eFeAAmE=w742-h240-k-no",
                  36.99578136536548, -122.05888865898311,"McHenry Library", '1156 High St, Santa Cruz, CA 95064'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOeApmS-HOGoTHGZ6lk9bAN9mW2BuIgpV3hfcUR=w408-h306-k-no",
                  36.99811991616817, -122.05571328710818,"BayTree Bookstore/Quarry Plaza", ""),
            ),SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMitcDDJGGTsFsfyQ1t8QBs3PxavsOc7GxHvd5I=w408-h306-k-no",
                  36.99786721918895, -122.05834495838793,"Science Hill", '', ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMEs2Va6iKq2nUfXXofPeduBZPvCOb8yVi2bhkK=w408-h306-k-no",
                  36.99803687001237, -122.05683525820898,"ClassroomUnit", ''),
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
