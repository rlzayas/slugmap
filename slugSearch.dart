import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_app/widgets/slugMapMain.dart';

class SearchResult {
  String name;

  SearchResult(this.name);
}

class BoolReference {
  bool isTrue;
  BoolReference(this.isTrue);
}

class slugSearch extends StatefulWidget {
  @override
  slugSearch({Key key, this.name}) : super(key: key);

  final String name;

  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<slugSearch> {
  ///////////////////////////////////////////////////////////////////////////
  Widget appBarTitle = new Text(
    "",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<SearchResult> _list = [];
  bool _IsSearching;
  String _searchText = "";
  String selectedSearchValue = "";

  _SearchState() {
    _searchQuery.addListener(() {
      setState(() {
        _IsSearching = true;
        _searchText = _searchQuery.text;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    //_IsSearching = false;
    createSearchResultList();
  }

  void createSearchResultList() {
    List<String> locations = [
      "ChargePoint Charging Station",
      "ChargePoint Charging Station",
      "EVgo Charging Station",
      "Stevenson Knoll",
      "Porter Squiggle",
      "Pogonip Vista Point",
      "Classroom Unit",
      "College Ten",
      "College Nine",
      "Cowell",
      "Stevenson",
      "Kresge",
      "Porter",
      "Oakes",
      "Rachel Carson",
      "Crown",
      "Merill",
      "Media Theater",
      "Earth and Marine Sciences Building",
      "OPERS",
      "Baskin Engineering",
      "Colleges Nine & Ten Dining Hall",
      "Crown/Merrill Dining Hall",
      "Cowell/Stevenson Dining Hall",
      "Porter/Kresge Dining Hall",
      "Rachel Carson/Oakes Dining Hall"
    ];
    //_list = <SearchResult>[];
    var locationCount = locations.length;
    for (int i = 0; i < locationCount; i++) {
      _list.add(new SearchResult(locations[i]));
      //suggestions.add(new ArbitrarySuggestionType(locations[i]));
    }

    // _list = <SearchResult>[
    //   new SearchResult('Google'),
    //   new SearchResult('IOS'),
    //   new SearchResult('IOS2'),
    //   new SearchResult('Android'),
    //   new SearchResult('Dart'),
    //   new SearchResult('Flutter'),
    //   new SearchResult('Python'),
    //   new SearchResult('React'),
    //   new SearchResult('Xamarin'),
    //   new SearchResult('Kotlin'),
    //   new SearchResult('Java'),
    //   new SearchResult('RxAndroid'),
    //   new SearchResult('RaAndroid'),
    //   new SearchResult('RbAndroid'),
    //   new SearchResult('RcAndroid'),
    //   new SearchResult('RdAndroid'),
    //   new SearchResult('ReAndroid'),
    //   new SearchResult('RfAndroid'),
    //   new SearchResult('RgAndroid'),
    //   new SearchResult('RhAndroid'),
    //   new SearchResult('RiAndroid'),
    //   new SearchResult('RjAndroid'),
    //   new SearchResult('RkAndroid'),
    //   new SearchResult('RlAndroid'),
    // ];
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //       key: key,
  //       appBar: buildBar(context),
  //       body: new Stack(
  //         children: <Widget>[
  //           new Container(
  //             height: 300.0,
  //             padding: EdgeInsets.all(10.0),
  //             child: new Container(
  //               child: ListView(
  //                 children: <Widget>[
  //                   // FILTERS GO HERE

  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                   // new Text("Hello World!"),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           displaySearchResults(),
  //         ],
  //       ));
  // }

  Widget displaySearchResults() {
    // if (_IsSearching) {
    //   return new Align(alignment: Alignment.topCenter, child: searchList());
    // } else {
    //   return new Align(alignment: Alignment.topCenter, child: new Container());
    // }

    return new Align(alignment: Alignment.topCenter, child: searchList());
  }

  ListView searchList() {
    List<SearchResult> results = _buildSearchList();
    var suggestionTap = new BoolReference(false);
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
      ),
      itemCount: _buildSearchList().isEmpty == null ? 0 : results.length,
      itemBuilder: (context, int index) {
        return Container(
          decoration: new BoxDecoration(
              color: Colors.grey[100],
              border: new Border(
                  bottom: new BorderSide(color: Colors.grey, width: 0.5))),
          child: ListTile(
            onTap: () {
              suggestionTap.isTrue = true;
              _displayTextField(results.elementAt(index).name, suggestionTap);
            },
            title: Text(results.elementAt(index).name,
                style: new TextStyle(fontSize: 18.0)),
          ),
        );
      },
    );
  }

  List<SearchResult> _buildList() {
    return _list.map((result) => new SearchResult(result.name)).toList();
  }

  List<SearchResult> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((result) => new SearchResult(result.name)).toList();
    } else {
      List<SearchResult> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        SearchResult result = _list.elementAt(i);
        if ((result.name).toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(result);
        }
      }
      return _searchList
          .map((result) => new SearchResult(result.name))
          .toList();
    }
  }

  // Widget buildBar(BuildContext context) {
  //   return new AppBar(
  //     centerTitle: true,
  //     title: appBarTitle,
  //     actions: <Widget>[
  //       new IconButton(
  //         icon: actionIcon,
  //         onPressed: () {
  //           BoolReference suggestionTap = new BoolReference(false);
  //           _displayTextField("", suggestionTap);
  //         },
  //       ),

  //       // new IconButton(icon: new Icon(Icons.more), onPressed: _IsSearching ? _showDialog(context, _buildSearchList()) : _showDialog(context,_buildList()))
  //     ],
  //   );
  // }

  String selectedPopupRoute = "My Home";
  final List<String> popupRoutes = <String>[
    "My Home",
    "Favorite Room 1",
    "Favorite Room 2"
  ];

  Widget _displayTextField(String searchInput, BoolReference suggestionTap) {
    setState(() {
      // this.actionIcon = new Icon(
      //   Icons.close,
      //   color: Colors.white,
      // );

      if (suggestionTap.isTrue) {
        _searchQuery.text = searchInput;
        suggestionTap.isTrue = false;
      }

      // this.appBarTitle = new TextField(
      //   autofocus: true,
      //   controller: _searchQuery,
      //   style: new TextStyle(
      //     color: Colors.white,
      //   ),
      // );

      _handleSearchStart();
    });

    return new TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: const EdgeInsets.only(
          left: 50,
          top: 0,
          right: 0,
          bottom: 13,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      autofocus: true,
      controller: _searchQuery,
      style: new TextStyle(
        color: Colors.black,
      ),
    );
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "",
        style: new TextStyle(color: Colors.white),
      );
      //_IsSearching = false;
      //_searchQuery.clear();
    });
  }

  ///////////////////////////////////////////////////////////////////////////
  Widget build(BuildContext context) {
    //phone dimensions
    double phoneWidth = MediaQuery.of(context).size.width; //375
    double phoneHeight = MediaQuery.of(context).size.height; //812
    BoolReference suggestionTap = new BoolReference(false);

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
              child: displaySearchResults(),
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
              child: _displayTextField("", suggestionTap),

              // TextButton(
              //   onPressed: () {
              //     // Navigator.push(
              //     // context,
              //     //MaterialPageRoute(builder: (context) => slugMapMain()), );
              //   },
              // ),
            ),
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
                      child: SvgPicture.asset(
                        'assets/images/Go_back.svg',
                      ),
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
          ],
        ),
      ),
    );
  }
}
