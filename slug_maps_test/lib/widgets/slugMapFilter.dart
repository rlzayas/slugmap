//import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
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
import 'Tour.dart';



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
      //label: Text("Open Speed Dial"),

      /// The active label of the main button, Defaults to label if not specified.
      //activeLabel: Text("Close Speed Dial"),

      /// Transition Builder between label and activeLabel, defaults to FadeTransition.
      //labelTransitionBuilder: (widget, animation) =>
      //ScaleTransition(scale: animation, child: widget),

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
      onClose: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => slugMapMain()),
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
          child: SvgPicture.asset('assets/images/apartment-black-18dp.svg'),
          label: 'Colleges',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Colleges()),
            );
          },
          onLongPress: () => print('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/restaurant-black-18dp.svg'),
          label: 'Dining halls',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiningHalls()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/import_contacts-24px.svg'),
          label: 'Libraries',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiningHalls()),
            );
          },
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/directions_bus-24px.svg'),
          label: 'Bus stops',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiningHalls()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/local_parking-24px.svg'),
          label: 'Parking',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiningHalls()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/directions_walk-24px.svg'),
          label: 'Hiking Trails',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiningHalls()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/local_see-24px.svg'),
          label: 'Views',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Views()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/opacity-24px.svg'),
          label: 'Water fill station',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WaterFillStation()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/ev_station-24px.svg'),
          label: 'EV charge station',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EVChargeStation()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: SvgPicture.asset('assets/images/explore-24px.svg'),
          label: 'School Tour',
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            letterSpacing: 2.7,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EVChargeStation()),
            );
          },
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: buildSpeedDial(),
    );
  }
}

//***************************************************
//* Speed dial, contains all of the filter options
//* for places and routes to the pages.
//***************************************************


SpeedDial buildSpeedDial(BuildContext context, double phoneWidth, double phoneHeight, bool _visible) {
//812 x 375
  return SpeedDial(

    marginEnd: phoneWidth * .04266666667,
    //16
    marginBottom: phoneHeight * .8842364532,
    //718
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: phoneWidth * .06266666667),
    //23
    buttonSize: phoneWidth * .06666666667,
    //25
    visible: _visible,
    curve: Curves.easeIn,
    backgroundColor: Color(0xffececec),
    foregroundColor: Colors.black,
    elevation: 0,
    orientation: SpeedDialOrientation.Down,
    childMarginBottom: 15,
    childMarginTop: 15,

    // onOpen: () => print('OPENING DIAL'),
    // onClose: () => print('CLOSING DIAL'),
    children: [

      //Colleges filter
      SpeedDialChild(

        child: SvgPicture.asset("assets/images/CollegeIcon.svg"),
        label: 'Colleges',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Colleges()),
          );
        },
        onLongPress: () => print('FIRST CHILD LONG PRESS'),
      ),

      //Dinning halls
      SpeedDialChild(
        // child: Icon(Icons),
        child: SvgPicture.asset('assets/images/restaurant-black-18dp.svg'),
        label: 'Dining halls',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiningHalls()),
          );
        },
      ),

      //Libraries
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/import_contacts-24px.svg'),
        label: 'Libraries',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Libraries()),
          );
        },
      ),

      //Bus stops
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/directions_bus-24px.svg'),
        label: 'Bus stops',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BusStops()),
          );
        },
      ),

      //Parking
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/local_parking-24px.svg'),
        label: 'Parking',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Parking()),
          );
        },
      ),

      //Hiking
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/directions_walk-24px.svg'),
        label: 'Hiking Trails',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HikingTrails()),
          );
        },
      ),

      //Views
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/local_see-24px.svg'),
        label: 'Views',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Views()),
          );
        },
      ),
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/opacity-24px.svg'),
        label: 'Water fill station',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WaterFillStation()),
          );
        },
      ),

      //EV charge station
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/ev_station-24px.svg'),
        label: 'EV charge station',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EVChargeStation()),
          );
        },
      ),

      //School tour
      SpeedDialChild(
        child: SvgPicture.asset('assets/images/explore-24px.svg'),
        label: 'School Tour',
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          letterSpacing: 2.7,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Tour()),
          );
        },
      ),
    ],
  );
}
