import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testing_app/widgets/evFilterMap.dart';
import 'package:testing_app/widgets/newTestMap.dart';
//import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollegesFilter extends StatefulWidget {
  @override
  _CollegesFilterState createState() => _CollegesFilterState();
}

class _CollegesFilterState extends State<CollegesFilter> {
  List<Marker> allMarkers= [];
  Completer<GoogleMapController> _controller = Completer();

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // College 9 and College 10 Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('9&10DH'),
      position: LatLng(37.00074493904557, -122.05776568771819),
      infoWindow: InfoWindow(
        title: 'Colleges 9 & 10 Dining Hall',
        snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Crown College and Merill College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('CrownMerrillDH'),
      position: LatLng(37.00014429303811, -122.05440605538377),
      infoWindow: InfoWindow(
        title: 'Crown/Merrill Dining Hall',
        snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Cowell College and Stevenson College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('CowellStevensonDH'),
      position: LatLng(36.99684124370638, -122.05303038435036),
      infoWindow: InfoWindow(
        title: 'Cowell/Stevenson Dining Hall',
        snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Porter College and Kresge College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('PorterKresgeDH'),
      position: LatLng(36.99431757933324, -122.06594174458701),
      infoWindow: InfoWindow(
        title: 'Porter/Kresge Dining Hall',
        snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Rachel Carson College and Oakes College Dining Hall Marker
    allMarkers.add(Marker(
      markerId: MarkerId('RCCOaksDH'),
      position: LatLng(36.99169329799685, -122.06539542111443),
      infoWindow: InfoWindow(
        title: 'Rachel Carson/Oaks Dining Hall',
        snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );
  }

  double zoomVal=5.0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: FaIcon(FontAwesomeIcons.arrowLeft),//Icon(FontAwesomeIcons.arrowLeft),
        //     onPressed: () {
        //       //
        //     }),
        title: Text("Dining Halls"),
        actions: <Widget>[
          Container(
          // height: phoneHeight * .02463054187,
          // width: phoneWidth * .05866666667,
          // margin: EdgeInsets.only(top: phoneHeight * .06650246305,
          // left: phoneWidth * .8693333333),
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
                          // MaterialPageRoute(builder: (context) => EVFilterMap()),);
                          MaterialPageRoute(builder: (context) => NewTestMap()),);
                    }
                    )
                      // IconButton(
              //     icon: Icon(FontAwesomeIcons.search),
              //     onPressed: () {
              //       //
              //     }),
            ],
          ),
    )
    ]
      ),
        body: Stack(
          children: <Widget>[
            _googleMap(context),
            _zoomminusfunction(),
            _zoomplusfunction(),
            _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.home),//Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.add),//Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(36.989043, -122.058611), zoom: zoomVal)));
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
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  40.738380, -73.988426,"Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421, -73.981667,"Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128, -73.999619,"Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
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
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
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
                      "4.1",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStarHalf,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(36.989043, -122.058611),
          zoom: 14.35,
        ),
        markers: Set.from(allMarkers),
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

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
    //       'assets/marker_icons/College.svg')
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