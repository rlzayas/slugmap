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

class BusStops extends StatefulWidget {
  @override
  _BusStopsState createState() => _BusStopsState();
}

class _BusStopsState extends State<BusStops> {
  //GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(36.989043, -122.058611);
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  List<Marker> allMarkers= [];

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  double zoomVal=5.0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     // Crown Merrill Apartments
//     allMarkers.add(Marker(
//       markerId: MarkerId('CrownMerrillApartments'),
//       position: LatLng(37.00233042537575, -122.05514425728445),
//       infoWindow: InfoWindow(
//         title: 'Crown Merrill Apartments',
//         // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Crown College
//     allMarkers.add(Marker(
//       markerId: MarkerId('CrownCollegeStop'),
//       position: LatLng(37.000633900624976, -122.0547259697124),
//       infoWindow: InfoWindow(
//         title: 'Crown College',
//         // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // McLaughlin Dr Crown & Merrill
//     allMarkers.add(Marker(
//       markerId: MarkerId('McLaughlinCrownMerrill'),
//       position: LatLng(36.99916009310121, -122.05526242543144),
//       infoWindow: InfoWindow(
//         title: 'McLaughlin Dr - Crown & Merrill',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // McLaughlin Dr College 9 & 10
//     allMarkers.add(Marker(
//       markerId: MarkerId('McLaughlin9&10'),
//       position: LatLng(37.000111176968524, -122.05834161731674),
//       infoWindow: InfoWindow(
//         title: 'McLaughlin Dr - College 9 & 10',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Hagar Dr Bookstore Cowell & Stevenson
//     allMarkers.add(Marker(
//       markerId: MarkerId('HagarDrBookstoreCowellStevenson'),
//       position: LatLng(36.99759205669758, -122.05506932708317),
//       infoWindow: InfoWindow(
//         title: 'Hagar Dr - Bookstore Cowell & Stevenson',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // College 9 & 10 - Health Ctr
//     allMarkers.add(Marker(
//       markerId: MarkerId('College9&10HealthCtr'),
//       position: LatLng(36.999819851908974, -122.05836306140019),
//       infoWindow: InfoWindow(
//         title: 'College 9 & 10 - Health Ctr',
//         // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Quarry Plaza
//     allMarkers.add(Marker(
//       markerId: MarkerId('Crown'),
//       position: LatLng(36.997550441702685, -122.05559345078998),
//       infoWindow: InfoWindow(
//         title: 'Crown College',
//         // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // McHenry Library
//     allMarkers.add(Marker(
//       markerId: MarkerId('McHenryLibrary'),
//       position: LatLng(36.99662498686069, -122.05872747625124),
//       infoWindow: InfoWindow(
//         title: 'McHenry Library',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Hagar Dr - Bookstore, Cowell & Stevenson
//     allMarkers.add(Marker(
//       markerId: MarkerId('HagarDrBookstoreCowellStevenson2'),
//       position: LatLng(36.99673078123862, -122.05542792797192),
//       infoWindow: InfoWindow(
//         title: 'Hagar Dr - Bookstore, Cowell & Stevenson',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Cowell College
//     allMarkers.add(Marker(
//       markerId: MarkerId('CowellCollegeStop'),
//       position: LatLng(36.997656186652065, -122.05316566865447),
//       infoWindow: InfoWindow(
//         title: 'Cowell College',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Stevenson College
//     allMarkers.add(Marker(
//       markerId: MarkerId('StevensonCollegeStop'),
//       position: LatLng(36.997726688461306, -122.05195179562119),
//       infoWindow: InfoWindow(
//         title: 'Stevenson College',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // East Field House
//     allMarkers.add(Marker(
//       markerId: MarkerId('EastFieldHouse'),
//       position: LatLng(36.994357248831975, -122.05555567118188),
//       infoWindow: InfoWindow(
//         title: 'East Field House',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // East Remote Lot Interior
//     allMarkers.add(Marker(
//       markerId: MarkerId('EastRemoteLotInterior'),
//       position: LatLng(36.99083982740803, -122.05214599406385),
//       infoWindow: InfoWindow(
//         title: 'East Remote Lot Interior',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Hagar Dr - East Remote Parking
//     allMarkers.add(Marker(
//       markerId: MarkerId('HagarDrEastRemoteParking'),
//       position: LatLng(36.99143835860411, -122.05467777622509),
//       infoWindow: InfoWindow(
//         title: 'Hagar Dr - East Remote Parking',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Hagar Dr - East Remote Parking 2
//     allMarkers.add(Marker(
//       markerId: MarkerId('HagarDrEastRemoteParking2'),
//       position: LatLng(36.99132284464544, -122.05493213962976),
//       infoWindow: InfoWindow(
//         title: 'Hagar Dr - East Remote Parking',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Hagar Dr & Village Rd
//     allMarkers.add(Marker(
//       markerId: MarkerId('HagarDr&VillageRd'),
//       position: LatLng(36.98611771147566, -122.053570734405),
//       infoWindow: InfoWindow(
//         title: 'Hagar Dr & Village Rd',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Hagar Dr & Village Rd 2
//     allMarkers.add(Marker(
//       markerId: MarkerId('HagarDr&VillageRd2'),
//       position: LatLng(36.985659456324726, -122.05360260590832),
//       infoWindow: InfoWindow(
//         title: 'Hagar Dr & Village Rd',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Sciences Hill
//     allMarkers.add(Marker(
//       markerId: MarkerId('SciencesHill'),
//       position: LatLng(36.99999517999754, -122.06239580451114),
//       infoWindow: InfoWindow(
//         title: 'Sciences Hill',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Science Hill
//     allMarkers.add(Marker(
//       markerId: MarkerId('ScienceHill'),
//       position: LatLng(36.99998015013614, -122.06210014694774),
//       infoWindow: InfoWindow(
//         title: 'Science Hill',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Kresge
//     allMarkers.add(Marker(
//       markerId: MarkerId('Kresge'),
//       position: LatLng(36.999405465723854, -122.06458358781089),
//       infoWindow: InfoWindow(
//         title: 'Kresge',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Heller Dr - MacLaughlin Dr
//     allMarkers.add(Marker(
//       markerId: MarkerId('HellerDrMacLaughlinDr'),
//       position: LatLng(36.99930624365153, -122.0643754201617),
//       infoWindow: InfoWindow(
//         title: 'Heller Dr - MacLaughlin Dr',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Thimann Labs
//     allMarkers.add(Marker(
//       markerId: MarkerId('ThimannLabs'),
//       position: LatLng(36.99758050992469, -122.06186820419856),
//       infoWindow: InfoWindow(
//         title: 'Thimann Labs',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Ker Hall
//     allMarkers.add(Marker(
//       markerId: MarkerId('KerHall'),
//       position: LatLng(36.996460411746426, -122.06172636265032),
//       infoWindow: InfoWindow(
//         title: 'Ker Hall',
//         // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Ker Hall 2
//     allMarkers.add(Marker(
//       markerId: MarkerId('KerHall2'),
//       position: LatLng(36.99687373686239, -122.06354222067843),
//       infoWindow: InfoWindow(
//         title: 'Ker Hall',
//         // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Media Theater
//     allMarkers.add(Marker(
//       markerId: MarkerId('MediaTheater'),
//       position: LatLng(36.995057927907524, -122.06147665236111),
//       infoWindow: InfoWindow(
//         title: 'Media Theater',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Recital Hall
//     allMarkers.add(Marker(
//       markerId: MarkerId('RecitalHall'),
//       position: LatLng(36.993328278997105, -122.06108488372507),
//       infoWindow: InfoWindow(
//         title: 'Recital Hall',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Heller Dr - RCC & Porter
//     allMarkers.add(Marker(
//       markerId: MarkerId('Heller Dr - RCC & Porter'),
//       position: LatLng(36.99314401014827, -122.06527673418728),
//       infoWindow: InfoWindow(
//         title: 'Heller Dr - Rachel Carson & Porter',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Heller Dr - RCC & Porter 2
//     allMarkers.add(Marker(
//       markerId: MarkerId('Heller Dr - RCC & Porter'),
//       position: LatLng(36.99287781889026, -122.06492693162627),
//       infoWindow: InfoWindow(
//         title: 'Heller Dr - Rachel Carson & Porter',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Family Student Housing
//     allMarkers.add(Marker(
//       markerId: MarkerId('FamilyStudentHousing'),
//       position: LatLng(36.991927960465915, -122.06678385499028),
//       infoWindow: InfoWindow(
//         title: 'Family Student Housing',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Oaks College
//     allMarkers.add(Marker(
//       markerId: MarkerId('OaksCollegeStop'),
//       position: LatLng(36.99081732602527, -122.06616193340405),
//       infoWindow: InfoWindow(
//         title: 'Oaks College',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // Oaks College 2
//     allMarkers.add(Marker(
//       markerId: MarkerId('OaksCollegeStop'),
//       position: LatLng(36.990094987857034, -122.06727081180792),
//       infoWindow: InfoWindow(
//         title: 'Oaks College',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//
//     // West Remote Lot
//     allMarkers.add(Marker(
//       markerId: MarkerId('WestRemoteRot'),
//       position: LatLng(36.98880072878589, -122.06482455918103),
//       infoWindow: InfoWindow(
//         title: 'West Remote Lot',
//         // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bus Stops'),
//       ),
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(36.989043, -122.058611),
//               zoom: 14.35,
//             ),
//             markers: Set.from(allMarkers),
//           ),
//         ),
//       ),
//     );
//   }
// }

  List<Marker> BusStopsList = [
    // Crown Merrill Apartments
    Marker(
      markerId: MarkerId('CrownMerrillApartments'),
      position: LatLng(37.00233042537575, -122.05514425728445),
      infoWindow: InfoWindow(
        title: 'Crown Merrill Apartments',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Crown College
    Marker(
      markerId: MarkerId('CrownCollegeStop'),
      position: LatLng(37.000633900624976, -122.0547259697124),
      infoWindow: InfoWindow(
        title: 'Crown College',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // McLaughlin Dr Crown & Merrill
    Marker(
      markerId: MarkerId('McLaughlinCrownMerrill'),
      position: LatLng(36.99916009310121, -122.05526242543144),
      infoWindow: InfoWindow(
        title: 'McLaughlin Dr - Crown & Merrill',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

    // McLaughlin Dr College 9 & 10
    Marker(
      markerId: MarkerId('McLaughlin9&10'),
      position: LatLng(37.000111176968524, -122.05834161731674),
      infoWindow: InfoWindow(
        title: 'McLaughlin Dr - College 9 & 10',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Hagar Dr Bookstore Cowell & Stevenson
    Marker(
      markerId: MarkerId('HagarDrBookstoreCowellStevenson'),
      position: LatLng(36.99759205669758, -122.05506932708317),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - Bookstore Cowell & Stevenson',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // College 9 & 10 - Health Ctr
    Marker(
      markerId: MarkerId('College9&10HealthCtr'),
      position: LatLng(36.999819851908974, -122.05836306140019),
      infoWindow: InfoWindow(
        title: 'College 9 & 10 - Health Ctr',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Quarry Plaza
    Marker(
      markerId: MarkerId('Crown'),
      position: LatLng(36.997550441702685, -122.05559345078998),
      infoWindow: InfoWindow(
        title: 'Crown College',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // McHenry Library
    Marker(
      markerId: MarkerId('McHenryLibrary'),
      position: LatLng(36.99662498686069, -122.05872747625124),
      infoWindow: InfoWindow(
        title: 'McHenry Library',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Hagar Dr - Bookstore, Cowell & Stevenson
    Marker(
      markerId: MarkerId('HagarDrBookstoreCowellStevenson2'),
      position: LatLng(36.99673078123862, -122.05542792797192),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - Bookstore, Cowell & Stevenson',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Cowell College
    Marker(
      markerId: MarkerId('CowellCollegeStop'),
      position: LatLng(36.997656186652065, -122.05316566865447),
      infoWindow: InfoWindow(
        title: 'Cowell College',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Stevenson College
    Marker(
      markerId: MarkerId('StevensonCollegeStop'),
      position: LatLng(36.997726688461306, -122.05195179562119),
      infoWindow: InfoWindow(
        title: 'Stevenson College',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // East Field House
    Marker(
      markerId: MarkerId('EastFieldHouse'),
      position: LatLng(36.994357248831975, -122.05555567118188),
      infoWindow: InfoWindow(
        title: 'East Field House',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // East Remote Lot Interior
    Marker(
      markerId: MarkerId('EastRemoteLotInterior'),
      position: LatLng(36.99083982740803, -122.05214599406385),
      infoWindow: InfoWindow(
        title: 'East Remote Lot Interior',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Hagar Dr - East Remote Parking
    Marker(
      markerId: MarkerId('HagarDrEastRemoteParking'),
      position: LatLng(36.99143835860411, -122.05467777622509),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - East Remote Parking',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Hagar Dr - East Remote Parking 2
    Marker(
      markerId: MarkerId('HagarDrEastRemoteParking2'),
      position: LatLng(36.99132284464544, -122.05493213962976),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - East Remote Parking',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Hagar Dr & Village Rd
    Marker(
      markerId: MarkerId('HagarDr&VillageRd'),
      position: LatLng(36.98611771147566, -122.053570734405),
      infoWindow: InfoWindow(
        title: 'Hagar Dr & Village Rd',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Hagar Dr & Village Rd 2
    Marker(
      markerId: MarkerId('HagarDr&VillageRd2'),
      position: LatLng(36.985659456324726, -122.05360260590832),
      infoWindow: InfoWindow(
        title: 'Hagar Dr & Village Rd',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Sciences Hill
    Marker(
      markerId: MarkerId('SciencesHill'),
      position: LatLng(36.99999517999754, -122.06239580451114),
      infoWindow: InfoWindow(
        title: 'Sciences Hill',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Science Hill
    Marker(
      markerId: MarkerId('ScienceHill'),
      position: LatLng(36.99998015013614, -122.06210014694774),
      infoWindow: InfoWindow(
        title: 'Science Hill',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Kresge
    Marker(
      markerId: MarkerId('Kresge'),
      position: LatLng(36.999405465723854, -122.06458358781089),
      infoWindow: InfoWindow(
        title: 'Kresge',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Heller Dr - MacLaughlin Dr
    Marker(
      markerId: MarkerId('HellerDrMacLaughlinDr'),
      position: LatLng(36.99930624365153, -122.0643754201617),
      infoWindow: InfoWindow(
        title: 'Heller Dr - MacLaughlin Dr',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Thimann Labs
    Marker(
      markerId: MarkerId('ThimannLabs'),
      position: LatLng(36.99758050992469, -122.06186820419856),
      infoWindow: InfoWindow(
        title: 'Thimann Labs',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Ker Hall
    Marker(
      markerId: MarkerId('KerHall'),
      position: LatLng(36.996460411746426, -122.06172636265032),
      infoWindow: InfoWindow(
        title: 'Ker Hall',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Ker Hall 2
    Marker(
      markerId: MarkerId('KerHall2'),
      position: LatLng(36.99687373686239, -122.06354222067843),
      infoWindow: InfoWindow(
        title: 'Ker Hall',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Media Theater
    Marker(
      markerId: MarkerId('MediaTheater'),
      position: LatLng(36.995057927907524, -122.06147665236111),
      infoWindow: InfoWindow(
        title: 'Media Theater',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Recital Hall
    Marker(
      markerId: MarkerId('RecitalHall'),
      position: LatLng(36.993328278997105, -122.06108488372507),
      infoWindow: InfoWindow(
        title: 'Recital Hall',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Heller Dr - RCC & Porter
    Marker(
      markerId: MarkerId('Heller Dr - RCC & Porter'),
      position: LatLng(36.99314401014827, -122.06527673418728),
      infoWindow: InfoWindow(
        title: 'Heller Dr - Rachel Carson & Porter',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Heller Dr - RCC & Porter 2
    Marker(
      markerId: MarkerId('Heller Dr - RCC & Porter'),
      position: LatLng(36.99287781889026, -122.06492693162627),
      infoWindow: InfoWindow(
        title: 'Heller Dr - Rachel Carson & Porter',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Family Student Housing
    Marker(
      markerId: MarkerId('FamilyStudentHousing'),
      position: LatLng(36.991927960465915, -122.06678385499028),
      infoWindow: InfoWindow(
        title: 'Family Student Housing',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Oaks College
    Marker(
      markerId: MarkerId('OaksCollegeStop'),
      position: LatLng(36.99081732602527, -122.06616193340405),
      infoWindow: InfoWindow(
        title: 'Oaks College',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // Oaks College 2
    Marker(
      markerId: MarkerId('OaksCollegeStop'),
      position: LatLng(36.990094987857034, -122.06727081180792),
      infoWindow: InfoWindow(
        title: 'Oaks College',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),


    // West Remote Lot
    Marker(
      markerId: MarkerId('WestRemoteRot'),
      position: LatLng(36.98880072878589, -122.06482455918103),
      infoWindow: InfoWindow(
        title: 'West Remote Lot',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),

  ];

  @override
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
              markers: Set.from(BusStopsList),
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

                            // MaterialPageRoute(
                            //     builder: (context) => slugMapFilter()),

                            // showPinsOnMap(),

                            // MaterialPageRoute(builder: (context) => CollegesFilter()),
                            // MaterialPageRoute(builder: (context) => EVFilterMap()),
                            // MaterialPageRoute(builder: (context) => EVFilterPage()), //works
                            // MaterialPageRoute(builder: (context) => EVMap()),

                            // MaterialPageRoute(builder: (context) => EVScreen()), //works

                            // MaterialPageRoute(builder: (context) => Colleges()),
                            // MaterialPageRoute(builder: (context) => DiningHalls()),
                            // MaterialPageRoute(builder: (context) => EVChargeStation()),
                            // MaterialPageRoute(builder: (context) => WaterFillStation()),
                            // MaterialPageRoute(builder: (context) => Views()),

                            // MaterialPageRoute(builder: (context) => BusStops())
                            MaterialPageRoute(builder: (context) => Parking())
                            // MaterialPageRoute(builder: (context) => Libraries())
                            // MaterialPageRoute(builder: (context) => HikingTrails())

                          // MaterialPageRoute(builder: (context) => EVScreen()), //works

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
            _zoomminusfunction(),
            _zoomplusfunction(),
            _buildContainer(),
          ],
        ),
      ),
    ); //812 x 375
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
                  40.738380, -73.988426,"Gramercy Tavern", 'hola'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421, -73.981667,"Le Bernardin", 'wassup'),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128, -73.999619,"Slug Maps", "DSC Solution Challenge"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName, String info) {
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
                      myDetailsContainer1(restaurantName, info),),
                  )

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName, String info) {
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
                      info,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStar,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             FontAwesomeIcons.solidStarHalf,
                //             color: Colors.amber,
                //             size: 15.0,
                //           ),
                //         ),
                //         Container(
                //             child: Text(
                //               "(946)",
                //               style: TextStyle(
                //                 color: Colors.black54,
                //                 fontSize: 18.0,
                //               ),
                //             )),
              ],
            )),
        // SizedBox(height:5.0),
        // Container(
        //     child: Text(
        //       "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
        //       style: TextStyle(
        //         color: Colors.black54,
        //         fontSize: 18.0,
        //       ),
        //     )),
        // SizedBox(height:5.0),
        // Container(
        //     child: Text(
        //       "Closed \u00B7 Opens 17:00 Thu",
        //       style: TextStyle(
        //           color: Colors.black54,
        //           fontSize: 18.0,
        //           fontWeight: FontWeight.bold),
        //     )),
      ],
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

}