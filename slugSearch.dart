import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class Places {
  String keyword;
  int id;
  String autocompleteterm;
  String country;

  Places({
    this.keyword,
    this.id,
    this.autocompleteterm,
    this.country
  });

  factory Places.fromJson(Map<String, dynamic> parsedJson) {
    return Places(
        keyword: parsedJson['keyword'] as String,
        id: parsedJson['id'],
        autocompleteterm: parsedJson['autocompleteTerm'] as String,
        country: parsedJson['country'] as String
    );
  }
}

class PlacesViewModel {
  static List<Places> places;

  static Future loadPlaces() async {
    try {
      places = new List<Places>();
      String jsonString = await rootBundle.loadString('assets/places.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['places'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        places.add(new Places.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
class slugSearch extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}
class _SearchState extends State<slugSearch> {
  //-------------------------------------------------------------------------------
  GlobalKey<AutoCompleteTextFieldState<Places>> key = new GlobalKey();

  AutoCompleteTextField searchTextField;

  TextEditingController controller = new TextEditingController();

  _SearchState();

  void _loadData() async {
    await PlacesViewModel.loadPlaces();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  //-------------------------------------------------------------------------------
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
        resizeToAvoidBottomPadding: false,
        body: new Center(
            child: new Column(children: <Widget>[
              new Column(children: <Widget>[
                searchTextField = AutoCompleteTextField<Places>(
                    style: new TextStyle(color: Colors.black, fontSize: 16.0),
                    decoration: new InputDecoration(
                        suffixIcon: Container(
                          width: 85.0,
                          height: 60.0,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                        filled: true,
                        hintText: 'Search Player Name',
                        hintStyle: TextStyle(color: Colors.black)),
                    itemSubmitted: (item) {
                      setState(() => searchTextField.textField.controller.text =
                          item.autocompleteterm);
                    },
                    clearOnSubmit: false,
                    key: key,
                    suggestions: PlacesViewModel.places,
                    itemBuilder: (context, item) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(item.autocompleteterm,
                            style: TextStyle(
                                fontSize: 16.0
                            ),),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                          ),
                          Text(item.country,
                          )
                        ],
                      );
                    },
                    itemSorter: (a, b) {
                      return a.autocompleteterm.compareTo(b.autocompleteterm);
                    },
                    itemFilter: (item, query) {
                      return item.autocompleteterm
                          .toLowerCase()
                          .startsWith(query.toLowerCase());
                    }),
              ]),
            ])));
/*
    return Scaffold(
      body: Container(
        height: phoneHeight,
        width: phoneWidth,
        color: Color(0xffe5e2e2),

        //Stack: Map, Search/filter selection
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: 0),
              width: phoneWidth,
              height: phoneHeight * .2130541872,
              decoration: BoxDecoration(
                color: Color(0xffececec),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffe5e2e2)
                  ),
                  BoxShadow(
                    color: Color(0xffe2e0e0),
                    blurRadius: 12,
                    spreadRadius: -12,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: phoneHeight * .2192118227),
              width: phoneWidth,
              height: phoneHeight * .7807881773,
              decoration: BoxDecoration(
                color: Color(0xffececec),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffe5e2e2)
                  ),
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

          ],
        ),
      ),
    );*/
  }
}