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

class HikingTrails extends StatefulWidget {
  @override
  _HikingTrailsState createState() => _HikingTrailsState();
}

class _HikingTrailsState extends State<HikingTrails> {
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

  List<Marker> hikingTrailList = [
    // Cave Gulch Trailhead
    Marker(
      markerId: MarkerId('GreatMeadow'),
      position: LatLng(36.98786124866043, -122.06890251669269),
      infoWindow: InfoWindow(
        title: 'Cave Gulch Trailhead',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

  // Great Meadow
  Marker(
  markerId: MarkerId('GreatMeadow'),
  position: LatLng(36.99232292142072, -122.05782280429814),
  infoWindow: InfoWindow(
  title: 'Great Meadow',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Heller Drive Trailhead
  Marker(
  markerId: MarkerId('HellerHillRoadTrailhead'),
  position: LatLng(37.00348848930636, -122.06596338499335),
  infoWindow: InfoWindow(
  title: 'Heller Drive  Trailhead',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // College 9 Trailhead
  Marker(
  markerId: MarkerId('College9Trailhead'),
  position: LatLng(37.00196297615762, -122.05787660963959),
  infoWindow: InfoWindow(
  title: 'College 9 Trailhead',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // College 10 Trailhead
  Marker(
  markerId: MarkerId('College10Trailhead'),
  position: LatLng(37.003746885938995, -122.05874986883879),
  infoWindow: InfoWindow(
  title: 'College 10 Trailhead',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Chinquapin Road Trailhead
  Marker(
  markerId: MarkerId('ChinquapinRoadTrailhead'),
  position: LatLng(37.002261789871916, -122.05607049993415),
  infoWindow: InfoWindow(
  title: 'Chinquapin Road Trailhead',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // U-Con Trail Trailhead
  Marker(
  markerId: MarkerId('UConTrailTrailhead'),
  position: LatLng(37.00225807152155, -122.05200633736733),
  infoWindow: InfoWindow(
  title: 'U-Con Trail Trailhead',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Koi Pond
  Marker(
  markerId: MarkerId('Koi Pond'),
  position: LatLng(37.00024830740773, -122.04829250486237),
  infoWindow: InfoWindow(
  title: 'Koi Pond',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Pogonip Historic Limekiln
  Marker(
  markerId: MarkerId('PogonipHistoricLimekiln'),
  position: LatLng(37.001319840045156, -122.04933310285453),
  infoWindow: InfoWindow(
  title: 'Pogonip Historic Limekiln',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Empire Cave
  Marker(
  markerId: MarkerId('EmpireCave'),
  position: LatLng(36.99617636224744, -122.06883543180497),
  infoWindow: InfoWindow(
  title: 'Empire Cave',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Porter Koi Pond
  Marker(
  markerId: MarkerId('PorterKoiPond'),
  position: LatLng(36.99420990009598, -122.06536281070382),
  infoWindow: InfoWindow(
  title: 'Porter Koi Pond',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Crown Meadow
  Marker(
  markerId: MarkerId('CrownMeadow'),
  position: LatLng(37.002720138086666, -122.05264625461085),
  infoWindow: InfoWindow(
  title: 'Crown Meadow',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Crown Meadow
  Marker(
  markerId: MarkerId('CrownMeadow2'),
  position: LatLng(37.00457530902208, -122.05735124061187),
  infoWindow: InfoWindow(
  title: 'Crown Meadow',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),

  // Seep Zone Interpretive Trail
  Marker(
  markerId: MarkerId('SeepZoneInterpretiveTrail'),
  position: LatLng(37.003359289995295, -122.06094499992527),
  infoWindow: InfoWindow(
  title: 'Seep Zone Interpretive Trail',
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
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
              markers: Set.from(hikingTrailList),
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
                  "https://lh5.googleusercontent.com/p/AF1QipNV2EASZ1r2d7sqiIoATtob5X6TbcOc1gK1599E=w408-h306-k-no",
                  37.00457530902208, -122.05735124061187,"Crown Meadow", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=kWYAvhy8jAbbn09wgOczlg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=39.63612&pitch=0&thumbfov=100",
                  37.002720138086666, -122.05264625461085,"Crown Meadow", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOSUXXSw0BZnjnuJu7FT18OMs0-wtjNnx7B6CBj=w408-h306-k-no",
                  36.99420990009598, -122.06536281070382,"Porter Koi Pond", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipPqSfA7hQahboiKZrKQ-3foIkwmIMrR3RxiLVk8=w408-h272-k-no",
                  36.99617636224744, -122.06883543180497,"Empire Cave", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOpm9lF4mlqHVtgekifhteeOYmtIraNj8l-KM2v=w408-h306-k-no",
                  37.001319840045156, -122.04933310285453,"Pogonip Historic Limekiln", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOWpeQWQQf9MDphEQVoLeP4LaI1mNZFlZx_hmGN=w408-h544-k-no",
                  37.00024830740773, -122.04829250486237,"Koi Pond", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOC_IAby6ud2BAna3UoctR6uMzzcHQGo7ET2QkC=w408-h725-k-no",
                  37.00225807152155, -122.05200633736733,"U-Con Trail Trailhead", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=zhkfbQr0s1joFOHDMC05KQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=294.63983&pitch=0&thumbfov=100",
                  37.002261789871916, -122.05607049993415,"Chinquapin Road Trailhead", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=eeitTZLxkwoUNQvK6sEXMA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=17.917072&pitch=0&thumbfov=100",
                  37.003746885938995, -122.05874986883879,"College 10 Trailhead", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6FUAOnpO5DXa8KBiHpFzNg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=40.259354&pitch=0&thumbfov=100",
                  37.00196297615762, -122.05787660963959,"College 9 Trailhead", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOaIRzm9bNkX5dZQdfhhPCKS79vYUo3_SfdZ6MM=w408-h306-k-no",
                  37.00336248460905, -122.06083630318761,"Seep Zone Interpretive Trail", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=6oV1bTg6ORsn7XOZ43yFfA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=352.02844&pitch=0&thumbfov=100",
                  37.00348848930636, -122.06596338499335,"Heller Drive  Trailhead", ""),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMcXF_5rz-Dk85CaEkaeZ0uVHU8atUhibZjqh6T=w574-h240-k-no",
                  36.99232292142072, -122.05782280429814,"Great Meadow", ''),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMuDhKBg5y2al4IqdGC_ug0cOHb54NAzDrLpt4h=w408-h240-k-no-pi-20-ya339-ro-0-fo100",
                  36.98786124866043, -122.06890251669269,"Cave Gulch Trailhead", ''),
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