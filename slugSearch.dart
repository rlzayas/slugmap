import 'dart:ui';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_app/widgets/BusStops.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locations {
  String name;
  String filter;

  double longitude;
  double latitude;

  Locations(this.name, this.filter, this.latitude, this.longitude);
}

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
  List<Locations> _list = [];
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

  createSearchResultList() {
    //List<Locations> santaCruzLocations = [];
    //new Locations("", "", , ),

    List<Locations> santaCruzLocations = [
      new Locations("ChargePoint Charging Station (Ocean St)",
          "EV Charge Stations", 36.9788943336269, -122.0223634179128),
      new Locations("ChargePoint Charging Station (McLaughlin Dr)",
          "EV Charge Stations", 36.999324250111506, -122.0632982467481),
      new Locations("EVgo Charging Station", "EV Charge Stations",
          36.98174810947192, -122.01507687519172),
      new Locations(
          "Cave Gulch", "Views", 36.99403252521436, -122.0690402904878),
      new Locations(
          "Stevenson Knoll", "Views", 36.996041133200166, -122.05165615971505),
      new Locations(
          "Porter Squiggle", "Views", 36.99340877871167, -122.06515297320963),
      new Locations("Pogonip Vista Point", "Views", 36.99067567820772,
          -122.04909315971524),
      new Locations("Pogonip Historic Limekiln", "Views", 37.00130432638354,
          -122.04928003710356),
      new Locations("Pogonip", "Views", 36.99550145357614, -122.04428228370232),
      new Locations(
          "Buddha Statue", "Views", 37.00660409811856, -122.06003603558892),
      new Locations("Tree 9", "Views", 37.004851356158554, -122.06020253899865),
      new Locations(
          "Garden of Eden", "Views", 37.024758967944, -122.0580458659901),
      new Locations("Classroom Unit", "Water Fill Stations", 36.99803687001237,
          -122.05683525820898),
      new Locations("Science Hill", "Water Fill Stations", 36.99786721918895,
          -122.05834495838793),
      new Locations("Baytree Bookstore / Quarry Plaza", "Water Fill Stations",
          36.99811991616817, -122.05571328710818),
      new Locations("McHenry Library", "Water Fill Stations", 36.99578136536548,
          -122.05888865898311),
      new Locations("Media Theater", "Water Fill Stations", 36.99525351792488,
          -122.06164320692419),
      new Locations("Earth & Marine Sciences Building", "Water Fill Stations",
          36.99819000796422, -122.05963315215398),
      new Locations("OPERS Upper East Field House", "Water Fill Stations",
          36.99483333081348, -122.05406975033789),
      new Locations("Jack Baskin Engineering", "Water Fill Stations",
          37.00058470510099, -122.06325024650194),
      new Locations(
          "College 9", "Colleges", 37.00173913642322, -122.05729768589005),
      new Locations(
          "College 10", "Colleges", 37.00083458438215, -122.05857488511316),
      new Locations(
          "Cowell College", "Colleges", 36.99737038347433, -122.05427346220672),
      new Locations("Stevenson College", "Colleges", 36.99718747230962,
          -122.0519119377878),
      new Locations(
          "Kresge College", "Colleges", 36.99765919789214, -122.06676649796817),
      new Locations(
          "Porter College", "Colleges", 36.99460980922041, -122.0653309811971),
      new Locations(
          "Oakes College", "Colleges", 36.989929657499914, -122.06277255820748),
      new Locations("Rachel Carson College", "Colleges", 36.99151711141353,
          -122.0647350052343),
      new Locations(
          "Crown College", "Colleges", 37.00044004525279, -122.05452639437944),
      new Locations("Merrill College", "Colleges", 36.99996850267072,
          -122.05330945824518),
      new Locations("Crown Merrill Apartments Bus Stop", "Bus Stops",
          37.00233042537575, -122.05514425728445),
      new Locations("Crown College Bus Stop", "Bus Stops", 37.000633900624976,
          -122.0547259697124),
      new Locations("McLaughlin Dr - Crown & Merrill Bus Stop", "Bus Stops",
          36.99916009310121, -122.05526242543144),
      new Locations("McLaughlin Dr - College 9 & 10 Bus Stop", "Bus Stops",
          37.000111176968524, -122.05834161731674),
      new Locations("Hagar Dr - Bookstore Cowell & Stevenson Bus Stop",
          "Bus Stops", 36.99759205669758, -122.05506932708317),
      new Locations("College 9 & 10 - Health Ctr Bus Stop", "Bus Stops",
          36.999819851908974, -122.05836306140019),
      new Locations("Quarry Plaza Bus Stop", "Bus Stops", 36.997550441702685,
          -122.05559345078998),
      new Locations("McHenry Library Plaza Bus Stop", "Bus Stops",
          36.99662498686069, -122.05872747625124),
      new Locations("Hagar Dr - Bookstore, Cowell & Stevenson Bus Stop",
          "Bus Stops", 36.99673078123862, -122.05542792797192),
      new Locations("Cowell College Bus Stop", "Bus Stops", 36.997656186652065,
          -122.05316566865447),
      new Locations("Stevenson College Bus Stop", "Bus Stops",
          36.997726688461306, -122.05195179562119),
      new Locations("East Field House Bus Stop", "Bus Stops",
          36.994357248831975, -122.05555567118188),
      new Locations("East Remote Lot Interior Bus Stop", "Bus Stops",
          36.99083982740803, -122.05214599406385),
      new Locations("Hagar Dr - East Remote Parking Bus Stop", "Bus Stops",
          36.99143835860411, -122.05467777622509),
      new Locations("Hagar Dr & Village Rd Bus Stop #1", "Bus Stops",
          36.98611771147566, -122.053570734405),
      new Locations("Hagar Dr & Village Rd Bus Stop #2", "Bus Stops",
          36.98611771147566, -122.053570734405),
      new Locations("Sciences Hill Bus Stop #1", "Bus Stops", 36.99999517999754,
          -122.06239580451114),
      new Locations("Sciences Hill Bus Stop #2", "Bus Stops", 36.99998015013614,
          -122.06210014694774),
      new Locations("Kresge Bus Stop", "Bus Stops", 36.999405465723854,
          -122.06458358781089),
      new Locations("Heller Dr - MacLaughlin Dr Bus Stop", "Bus Stops",
          36.99930624365153, -122.0643754201617),
      new Locations("Thimann Labs Bus Stop", "Bus Stops", 36.99758050992469,
          -122.06186820419856),
      new Locations("KerHall Bus Stop #1", "Bus Stops", 36.996460411746426,
          -122.06172636265032),
      new Locations("KerHall Bus Stop #2", "Bus Stops", 36.99687373686239,
          -122.06354222067843),
      new Locations("MediaTheater Bus Stop", "Bus Stops", 36.995057927907524,
          -122.06147665236111),
      new Locations("Recital Hall Bus Stop", "Bus Stops", 36.993328278997105,
          -122.06108488372507),
      new Locations("Heller Dr - RCC & Porter Bus Stop #1", "Bus Stops",
          36.99314401014827, -122.06527673418728),
      new Locations("Heller Dr - RCC & Porter Bus Stop #2", "Bus Stops",
          36.99287781889026, -122.06492693162627),
      new Locations("Family Student Housing Bus Stop", "Bus Stops",
          36.991927960465915, -122.06678385499028),
      new Locations("Oakes College Bus Stop #1", "Bus Stops", 36.99081732602527,
          -122.06616193340405),
      new Locations("Oakes College Bus Stop #2", "Bus Stops",
          36.990094987857034, -122.06727081180792),
      new Locations("West Remote Lot", "Bus Stops", 36.98880072878589,
          -122.06482455918103),
      new Locations("Colleges 9 & 10 Dining Hall", "Dining Halls",
          37.00074493904557, -122.05776568771819),
      new Locations("Crown/Merrill Dining Hall", "Dining Halls",
          37.00014429303811, -122.05440605538377),
      new Locations("Cowell/Stevenson Dining Hall", "Dining Halls",
          36.99684124370638, -122.05303038435036),
      new Locations("Porter/Kresge Dining Hall", "Dining Halls",
          36.99431757933324, -122.06594174458701),
      new Locations("Rachel Carson/Oakes Dining Hall", "Dining Halls",
          36.99169329799685, -122.06539542111443),
      new Locations("Cave Gulch Trailhead", "Hiking Trails", 36.98786124866043,
          -122.06890251669269),
      new Locations("Great Meadow", "Hiking Trails", 36.99232292142072,
          -122.05782280429814),
      new Locations("Heller Drive Trailhead", "Hiking Trails",
          37.00348848930636, -122.06596338499335),
      new Locations("College 9 Trailhead", "Hiking Trails", 37.00196297615762,
          -122.05787660963959),
      new Locations("College 10 Trailhead", "Hiking Trails", 37.003746885938995,
          -122.05874986883879),
      new Locations("Chinquapin Road Trailhead", "Hiking Trails",
          37.002261789871916, -122.05607049993415),
      new Locations("U-Con Trail Trailhead", "Hiking Trails", 37.00225807152155,
          -122.05200633736733),
      new Locations(
          "Koi Pond", "Hiking Trails", 37.00024830740773, -122.04829250486237),
      new Locations("Pogonip Historic Limekiln", "Hiking Trails",
          37.001319840045156, -122.04933310285453),
      new Locations("Empire Cave", "Hiking Trails", 36.99617636224744,
          -122.06883543180497),
      new Locations("Porter Koi Pond", "Hiking Trails", 36.99420990009598,
          -122.06536281070382),
      new Locations("Crown Meadow #1", "Hiking Trails", 37.002720138086666,
          -122.05264625461085),
      new Locations("Crown Meadow #2", "Hiking Trails", 37.00457530902208,
          -122.05735124061187),
      new Locations("Seep Zone Interpretive Trail", "Hiking Trails",
          37.003359289995295, -122.06094499992527),
      new Locations("Adlai E. Stevenson Library", "Libraries",
          36.99722897221115, -122.05151323142576),
      new Locations("Page Smith Library", "Libraries", 36.99716490316114,
          -122.0536526692152),
      new Locations("Merrill Library", "Libraries", 36.999711831435256,
          -122.05336351136583),
      new Locations(
          "Crown Library", "Libraries", 36.99993912279547, -122.05486909133349),
      new Locations("McHenry Library", "Libraries", 36.99578136536548,
          -122.05888865898311),
      new Locations("Science & Engineering Library", "Libraries",
          36.99910517369182, -122.06059399782959),
      new Locations("Kresge Student Library", "Libraries", 36.997603292930194,
          -122.06623329784122),
      new Locations(
          "Oaks Library", "Libraries", 36.989953862713904, -122.06289888474468),
      new Locations("East Remote Parking Lot", "Parking", 36.99203741631251,
          -122.05312085074124),
      new Locations(
          "Vadim Parking", "Parking", 37.003064125211885, -122.05382987511449),
      new Locations("BikeLink - UCSC Engineering 2", "Parking",
          37.00091361781477, -122.06214367853134),
      new Locations("BikeLink - UCSC Baskin", "Parking", 37.000448611438934,
          -122.06263563208518),
      new Locations("BikeLink - Science Library", "Parking", 36.99894224131143,
          -122.06073235461466),
      new Locations(
          "Parking Lot 114", "Parking", 37.00018773303434, -122.05896582287743),
      new Locations(
          "Zipcar", "Parking", 37.000142793660984, -122.05899759905863),
      new Locations("North Perimeter Parking Lot 150", "Parking",
          37.00254987296524, -122.06590202346045),
      new Locations("Parking Lot 139A", "Parking", 37.001553656934625,
          -122.06244957438545),
    ];

    int indexFound = 0;
    var locationCount = santaCruzLocations.length;
    for (indexFound; indexFound < locationCount; indexFound++) {
      _list.add(new Locations(
          santaCruzLocations[indexFound].name,
          santaCruzLocations[indexFound].filter,
          santaCruzLocations[indexFound].latitude,
          santaCruzLocations[indexFound].longitude));
    }
  }

  Widget displaySearchResults() {
    return new Align(alignment: Alignment.topCenter, child: searchList());
  }

  ListView searchList() {
    List<Locations> results = _buildSearchList();
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

              // ADD CODE
              // print(results[index].latitude);
              // print(results[index].longitude);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new BusStops(
                          results[index].latitude, results[index].longitude)));
              // _gotoLocation(results[index].latitude, results[index].longitude);
            },
            title: Text(results.elementAt(index).name,
                style: new TextStyle(fontSize: 18.0)),
          ),
        );
      },
    );
  }

  List<Locations> _buildList() {
    return _list.map((result) => new Locations(
        result.name, result.filter, result.latitude, result.longitude));
  }

  List<Locations> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list
          .map((result) => new Locations(
              result.name, result.filter, result.latitude, result.longitude))
          .toList();
    } else {
      List<Locations> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        Locations result = _list.elementAt(i);
        if ((result.name).toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(result);
        }
      }
      return _searchList
          .map((result) => new Locations(
              result.name, result.filter, result.latitude, result.longitude))
          .toList();
    }
  }

  String selectedPopupRoute = "My Home";
  final List<String> popupRoutes = <String>[
    "My Home",
    "Favorite Room 1",
    "Favorite Room 2"
  ];

  Widget _displayTextField(String searchInput, BoolReference suggestionTap) {
    setState(() {
      if (suggestionTap.isTrue) {
        _searchQuery.text = searchInput;
        suggestionTap.isTrue = false;
      }
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

  // //GoogleMapController mapController;
  // Completer<GoogleMapController> _controller = Completer();
  // static const LatLng _center = const LatLng(36.989043, -122.058611);
  // LatLng _lastMapPosition = _center;
  // MapType _currentMapType = MapType.normal;

  // _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  // _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }

  // double zoomVal = 5.0;

  // Future<void> _gotoLocation(double lat, double long) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //     target: LatLng(lat, long),
  //     zoom: 15,
  //     tilt: 50.0,
  //     bearing: 45.0,
  //   )));
  // }
}
