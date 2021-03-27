import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class slugSearch extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<slugSearch> {
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  _SearchState() {
    textField = SimpleAutoCompleteTextField(
      key: key,
      style: TextStyle(fontSize: 18.0, color: Colors.black),
      decoration: new InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      controller: TextEditingController(text: ""),
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      clearOnSubmit: false,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.add(text);
        }
      }),
    );
  }

  List<String> suggestions = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];

  SimpleAutoCompleteTextField textField;
  bool showWhichErrorText = false;

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
              height: phoneHeight * .14310344828,
              margin: EdgeInsets.only(
                  top: phoneHeight * .037, left: phoneWidth * .048),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: new Column(children: [
                new ListTile(
                  title: textField,
                  leading:

                      // Rey's back button
                      // FloatingActionButton(
                      //     backgroundColor: Color(0xffececec),
                      //     elevation: 0,
                      //     child: SvgPicture.asset(
                      //       'assets/images/Go_back.svg',
                      //     ),
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => slugMapMain()),
                      //       );
                      //     }),

                      // New back button implementation
                      new IconButton(
                          icon: new Icon(Icons.arrow_back_ios),
                          color: Colors.black,
                          splashColor: Colors.blue,
                          iconSize: 18.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => slugMapMain()),
                            );
                          }),
                ),
              ]),

              // Older implementation (ignore)
              //textField,

              // new IconButton(
              //   icon: new Icon(Icons.arrow_back_ios),
              //   iconSize: 18.0,
              //   onPressed: () {})

              //     TextButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => slugMapMain()),
              //     );
              //   },
              // ),
            ),

            // Container(
            //   margin: EdgeInsets.only(
            //       left: phoneWidth * .05866666667,
            //       top: phoneHeight * .05911330049),
            //   width: phoneWidth * .08,
            //   height: phoneHeight * .03694581281,
            //   child: Stack(
            //     children: <Widget>[
            // FloatingActionButton(
            //     backgroundColor: Color(0xffececec),
            //     elevation: 0,
            //     child: SvgPicture.asset(
            //       'assets/images/Go_back.svg',
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => slugMapMain()),
            //       );
            //     }),
            //   ],
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
