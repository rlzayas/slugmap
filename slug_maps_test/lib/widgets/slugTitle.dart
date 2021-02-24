import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testing_app/widgets/slugMapMain.dart';

class slugTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //phone dimensions
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: phoneHeight,
        width: phoneWidth,
        alignment: Alignment.center,
        //Stack allows for different containers to overalay on top of one another
        child: Stack(
          children: <Widget>[
            //Container 1: BackGround Graphics for Homepage
            Container(
              height: phoneHeight,
              width: phoneWidth,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Main_Screen_Background.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            //Container 2: Logo!
            Container(
              margin:  EdgeInsets.only(
                  left: phoneWidth * .1187335092, top: phoneHeight * .1231527094),
              width: phoneWidth * .728,
              height: phoneHeight * .3041871921,
              child: Image.asset(
                'assets/images/Slug_Logo.png',
                fit: BoxFit.fitHeight,
              ),

            ),
            //Container 3: Slug Maps Title!
            Container(
              margin: EdgeInsets.only(top: phoneHeight * .4285714286),
              child: SizedBox(
                width: phoneWidth,
                height: 50,
                child: Text(
                  "SLUG MAPS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 41,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 9.22,
                  ),
                ),
              ),
            ),
            //Container 4: Let's go Button!
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: phoneHeight * .7549261084),
              child: TextButton(
                onPressed: () {
                  //PAGE NAV HERE
                  //Syntax
                  Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => slugMapMain(),
                  //           transitionsBuilder: (context, animation1, animation2, child) =>
                  //                 FadeTransition(opacity: animation1, child: child),
                  //             transitionDuration: Duration(milliseconds: 300),
                  //           ),
                  //         );
                  ),
                  );
                },
                //CONTAINER FOR STYLING OF LETS GO BUTTON
                child: Container(
                  width: phoneWidth * .7653333333,
                  height: phoneHeight * .06280788177,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x35000000),
                        blurRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Color(0xFF4DD0E1),
                  ),
                  padding: const EdgeInsets.only(
                    left: 2,
                    top: 7,
                    bottom: 7,
                  ),
                  child: SizedBox(
                    width: phoneWidth * 0.76,
                    height: phoneHeight * .04064039409,
                    child: Text(
                      "LET’S GO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xd6fff989),
                        fontSize: 22,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 4.05,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
