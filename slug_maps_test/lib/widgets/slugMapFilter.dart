import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

class slugMapFilter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<slugMapFilter> with TickerProviderStateMixin {
  ScrollController scrollController;
  bool dialVisible = true;

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

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  Widget buildBody() {
    return Scaffold(
        body: Stack(
          children: <Widget>[
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
          ],
        ));
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      /// both default to 16
      marginEnd: 18,
      marginBottom: 670,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),

      /// This is ignored if animatedIcon is non null
      //icon: Icons.add,
      //activeIcon: Icons.remove,
      // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),

      /// The label of the main button.
      // label: Text("Open Speed Dial"),
      /// The active label of the main button, Defaults to label if not specified.
      // activeLabel: Text("Close Speed Dial"),
      /// Transition Builder between label and activeLabel, defaults to FadeTransition.
      // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
      /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
      buttonSize: 56.0,
      visible: true,

      /// If true user is forced to close dial manually
      /// by tapping main button and overlay is not rendered.
      closeManually: true,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () { // => print('DIAL CLOSED'),
        Navigator.push(context, MaterialPageRoute(builder:(context) => slugMapMain())
        );
      },
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),

      orientation: SpeedDialOrientation.Down,
      // childMarginBottom: 2,
      // childMarginTop: 2,
      gradientBoxShape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, Colors.white],
      ),
      children: [
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Colleges_Icon.svg'),
          //backgroundColor: Colors.red,
          label: 'Colleges',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('FIRST CHILD'),
          onLongPress: () => print('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Dining_Hall_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'Dining halls',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Library_Icon.svg'),
          //backgroundColor: Colors.green,
          label: 'Libraries',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('THIRD CHILD'),
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Bus_Stop_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'Bus stops',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Parking_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'Parking',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Hiking_Trail_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'Hiking Trails',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Views_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'Views',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/Water_Station_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'Water fill station',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/EV_Station_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'EV charge station',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/marker_icons/School_Tour_Icon.svg'),
          //backgroundColor: Colors.blue,
          label: 'School Tour',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () => print('SECOND CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    return Scaffold(
      //appBar: AppBar(title: Text('Flutter Speed Dial')),
      body: buildBody(),
      // floatingActionButton: buildSpeedDial(),
    );
  }
}

// class _FilterState extends State<slugMapFilter> {
//   Widget build(BuildContext context) {
//     double phoneWidth = MediaQuery.of(context).size.width; //375
//     double phoneHeight = MediaQuery.of(context).size.height; //812

//     return Scaffold(
//       floatingActionButton: SpeedDial(
//         //both default to 16
//         marginBottom: phoneHeight - 100,
//         animatedIcon: AnimatedIcons.menu_close,
//         orientation: SpeedDialOrientation.Down,
//         children: [
//           SpeedDialChild(
//               child: Icon(Icons.ac_unit),
//               label: "First Item",
//               onTap: () => print("First!"))
//         ],
//       ),
//     );
//   }
// }
