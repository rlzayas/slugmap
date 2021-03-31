import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testing_app/widgets/BusStops.dart';
import 'package:testing_app/widgets/Colleges.dart';
import 'package:testing_app/widgets/DiningHalls.dart';
import 'package:testing_app/widgets/EVChargeStation.dart';
import 'package:testing_app/widgets/HikingTrails.dart';
import 'package:testing_app/widgets/Libraries.dart';
import 'package:testing_app/widgets/Parking.dart';
import 'package:testing_app/widgets/Tour.dart';
import 'package:testing_app/widgets/Views.dart';
import 'package:testing_app/widgets/WaterFillStation.dart';
import 'package:testing_app/widgets/slugMapMain.dart';

class slugSearch extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<slugSearch> {
  Widget build(BuildContext context) {
    //phone dimensions
    double phoneWidth = MediaQuery.of(context).size.width; //375
    double phoneHeight = MediaQuery.of(context).size.height; //812


    return Scaffold(
      body: Container(
        height: phoneHeight,
        width: phoneWidth,
        color: Color(0xffe5e2e2),

        //Stack: Map, Search/filter selection
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 0),
              width: phoneWidth,
              height: phoneHeight * .2130541872,
              decoration: BoxDecoration(
                color: Color(0xffececec),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Color(0xffe5e2e2)),
                  BoxShadow(
                    color: Color(0xffe2e0e0),
                    blurRadius: 12,
                    spreadRadius: -12,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: phoneHeight * .2192118227),
              width: phoneWidth,
              height: phoneHeight * .7807881773,
              decoration: BoxDecoration(
                color: Color(0xffececec),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Color(0xffe5e2e2)),
                  BoxShadow(
                    color: Color(0xffe2e0e0),
                    blurRadius: 12,
                    spreadRadius: -12,
                  ),
                ],
              ),
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
                    offset: Offset(0, 2),
                  ),
                ],
                color: Color(0xffececec),
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
                  // Navigator.push(
                  // context,
                  //MaterialPageRoute(builder: (context) => slugMapMain()), );
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
                children: <Widget>[
                  FloatingActionButton(
                      backgroundColor: Color(0xffececec),
                      elevation: 0,

                      child: SvgPicture.asset('assets/images/Go_back.svg',),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => slugMapMain()),
                        );
                      }),
                ],
              ),
            ),

            _buildFilterSlider(context, phoneWidth, phoneHeight),

          ],
        ),
      ),
    );
  }


  Container filterSlide(double phoneWidth, double phoneHeight, String asset, String hero, Widget goFilter) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: phoneWidth * .02666666667),
      width: phoneWidth * .12, //45
      height: phoneHeight * .05541871921, //45
      child: Stack(
        children: <Widget>[
          FloatingActionButton(
              heroTag: hero,
              backgroundColor: Color(0xffececec),
              elevation: 2,
              child: SvgPicture.asset(asset,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => goFilter),
                );
              }
          ),
        ],
      ),
    );

  }

  Widget _buildFilterSlider(BuildContext Context, double phoneWidth, double phoneHeight) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: phoneHeight * .1231527094, horizontal: phoneWidth * .02666666667), //100, 10
      //height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          filterSlide(phoneWidth, phoneHeight, 'assets/images/CollegeIcon.svg', 'btn1', Colleges() ),                   //Colleges tile
          filterSlide(phoneWidth, phoneHeight, 'assets/images/restaurant-black-18dp.svg', 'btn2', DiningHalls()),       //Dinning halls
          filterSlide(phoneWidth, phoneHeight, 'assets/images/import_contacts-24px.svg', 'btn3', Libraries()),          //libraries
          filterSlide(phoneWidth, phoneHeight, 'assets/images/directions_bus-24px.svg', 'btn4', BusStops()),            //bus stops
          filterSlide(phoneWidth, phoneHeight, 'assets/images/local_parking-24px.svg', 'btn5', Parking()),              //parking lots
          filterSlide(phoneWidth, phoneHeight, 'assets/images/directions_walk-24px.svg', 'btn6', HikingTrails()),       //Hiking
          filterSlide(phoneWidth, phoneHeight, 'assets/images/local_see-24px.svg', 'btn7', Views()),                    //Views
          filterSlide(phoneWidth, phoneHeight, 'assets/images/opacity-24px.svg', 'btn8', WaterFillStation()),           //Water fill stations
          filterSlide(phoneWidth, phoneHeight, 'assets/images/ev_station-24px.svg', 'btn9', EVChargeStation()),         //EV charge
          filterSlide(phoneWidth, phoneHeight, 'assets/images/explore-24px.svg', 'btn10', Tour()),                      //School tour

        ],
      ),
    );
  }

}
