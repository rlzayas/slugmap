import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:testing_app/widgets/slugMapFilter.dart';
import 'package:testing_app/widgets/slugMapMain.dart';
import 'package:testing_app/widgets/slugSearch.dart';

class BusStops extends StatefulWidget {
  @override
  _BusStopsState createState() => _BusStopsState();
}

class _BusStopsState extends State<BusStops> {
  List<Marker> allMarkers= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Crown Merrill Apartments
    allMarkers.add(Marker(
      markerId: MarkerId('CrownMerrillApartments'),
      position: LatLng(37.00233042537575, -122.05514425728445),
      infoWindow: InfoWindow(
        title: 'Crown Merrill Apartments',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Crown College
    allMarkers.add(Marker(
      markerId: MarkerId('CrownCollegeStop'),
      position: LatLng(37.000633900624976, -122.0547259697124),
      infoWindow: InfoWindow(
        title: 'Crown College',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // McLaughlin Dr Crown & Merrill
    allMarkers.add(Marker(
      markerId: MarkerId('McLaughlinCrownMerrill'),
      position: LatLng(36.99916009310121, -122.05526242543144),
      infoWindow: InfoWindow(
        title: 'McLaughlin Dr - Crown & Merrill',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // McLaughlin Dr College 9 & 10
    allMarkers.add(Marker(
      markerId: MarkerId('McLaughlin9&10'),
      position: LatLng(37.000111176968524, -122.05834161731674),
      infoWindow: InfoWindow(
        title: 'McLaughlin Dr - College 9 & 10',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Hagar Dr Bookstore Cowell & Stevenson
    allMarkers.add(Marker(
      markerId: MarkerId('HagarDrBookstoreCowellStevenson'),
      position: LatLng(36.99759205669758, -122.05506932708317),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - Bookstore Cowell & Stevenson',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // College 9 & 10 - Health Ctr
    allMarkers.add(Marker(
      markerId: MarkerId('College9&10HealthCtr'),
      position: LatLng(36.999819851908974, -122.05836306140019),
      infoWindow: InfoWindow(
        title: 'College 9 & 10 - Health Ctr',
        // snippet: 'McLaughlin Dr, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Quarry Plaza
    allMarkers.add(Marker(
      markerId: MarkerId('Crown'),
      position: LatLng(36.997550441702685, -122.05559345078998),
      infoWindow: InfoWindow(
        title: 'Crown College',
        // snippet: '630 Crown Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // McHenry Library
    allMarkers.add(Marker(
      markerId: MarkerId('McHenryLibrary'),
      position: LatLng(36.99662498686069, -122.05872747625124),
      infoWindow: InfoWindow(
        title: 'McHenry Library',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Hagar Dr - Bookstore, Cowell & Stevenson
    allMarkers.add(Marker(
      markerId: MarkerId('HagarDrBookstoreCowellStevenson2'),
      position: LatLng(36.99673078123862, -122.05542792797192),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - Bookstore, Cowell & Stevenson',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Cowell College
    allMarkers.add(Marker(
      markerId: MarkerId('CowellCollegeStop'),
      position: LatLng(36.997656186652065, -122.05316566865447),
      infoWindow: InfoWindow(
        title: 'Cowell College',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Stevenson College
    allMarkers.add(Marker(
      markerId: MarkerId('StevensonCollegeStop'),
      position: LatLng(36.997726688461306, -122.05195179562119),
      infoWindow: InfoWindow(
        title: 'Stevenson College',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // East Field House
    allMarkers.add(Marker(
      markerId: MarkerId('EastFieldHouse'),
      position: LatLng(36.994357248831975, -122.05555567118188),
      infoWindow: InfoWindow(
        title: 'East Field House',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // East Remote Lot Interior
    allMarkers.add(Marker(
      markerId: MarkerId('EastRemoteLotInterior'),
      position: LatLng(36.99083982740803, -122.05214599406385),
      infoWindow: InfoWindow(
        title: 'East Remote Lot Interior',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Hagar Dr - East Remote Parking
    allMarkers.add(Marker(
      markerId: MarkerId('HagarDrEastRemoteParking'),
      position: LatLng(36.99143835860411, -122.05467777622509),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - East Remote Parking',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Hagar Dr - East Remote Parking 2
    allMarkers.add(Marker(
      markerId: MarkerId('HagarDrEastRemoteParking2'),
      position: LatLng(36.99132284464544, -122.05493213962976),
      infoWindow: InfoWindow(
        title: 'Hagar Dr - East Remote Parking',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Hagar Dr & Village Rd
    allMarkers.add(Marker(
      markerId: MarkerId('HagarDr&VillageRd'),
      position: LatLng(36.98611771147566, -122.053570734405),
      infoWindow: InfoWindow(
        title: 'Hagar Dr & Village Rd',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Hagar Dr & Village Rd 2
    allMarkers.add(Marker(
      markerId: MarkerId('HagarDr&VillageRd2'),
      position: LatLng(36.985659456324726, -122.05360260590832),
      infoWindow: InfoWindow(
        title: 'Hagar Dr & Village Rd',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Sciences Hill
    allMarkers.add(Marker(
      markerId: MarkerId('SciencesHill'),
      position: LatLng(36.99999517999754, -122.06239580451114),
      infoWindow: InfoWindow(
        title: 'Sciences Hill',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Science Hill
    allMarkers.add(Marker(
      markerId: MarkerId('ScienceHill'),
      position: LatLng(36.99998015013614, -122.06210014694774),
      infoWindow: InfoWindow(
        title: 'Science Hill',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Kresge
    allMarkers.add(Marker(
      markerId: MarkerId('Kresge'),
      position: LatLng(36.999405465723854, -122.06458358781089),
      infoWindow: InfoWindow(
        title: 'Kresge',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Heller Dr - MacLaughlin Dr
    allMarkers.add(Marker(
      markerId: MarkerId('HellerDrMacLaughlinDr'),
      position: LatLng(36.99930624365153, -122.0643754201617),
      infoWindow: InfoWindow(
        title: 'Heller Dr - MacLaughlin Dr',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Thimann Labs
    allMarkers.add(Marker(
      markerId: MarkerId('ThimannLabs'),
      position: LatLng(36.99758050992469, -122.06186820419856),
      infoWindow: InfoWindow(
        title: 'Thimann Labs',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Ker Hall
    allMarkers.add(Marker(
      markerId: MarkerId('KerHall'),
      position: LatLng(36.996460411746426, -122.06172636265032),
      infoWindow: InfoWindow(
        title: 'Ker Hall',
        // snippet: '520 Cowell-Stevenson Road, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Ker Hall 2
    allMarkers.add(Marker(
      markerId: MarkerId('KerHall2'),
      position: LatLng(36.99687373686239, -122.06354222067843),
      infoWindow: InfoWindow(
        title: 'Ker Hall',
        // snippet: '411 Porter-Kresge Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Media Theater
    allMarkers.add(Marker(
      markerId: MarkerId('MediaTheater'),
      position: LatLng(36.995057927907524, -122.06147665236111),
      infoWindow: InfoWindow(
        title: 'Media Theater',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Recital Hall
    allMarkers.add(Marker(
      markerId: MarkerId('RecitalHall'),
      position: LatLng(36.993328278997105, -122.06108488372507),
      infoWindow: InfoWindow(
        title: 'Recital Hall',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Heller Dr - RCC & Porter
    allMarkers.add(Marker(
      markerId: MarkerId('Heller Dr - RCC & Porter'),
      position: LatLng(36.99314401014827, -122.06527673418728),
      infoWindow: InfoWindow(
        title: 'Heller Dr - Rachel Carson & Porter',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Heller Dr - RCC & Porter 2
    allMarkers.add(Marker(
      markerId: MarkerId('Heller Dr - RCC & Porter'),
      position: LatLng(36.99287781889026, -122.06492693162627),
      infoWindow: InfoWindow(
        title: 'Heller Dr - Rachel Carson & Porter',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Family Student Housing
    allMarkers.add(Marker(
      markerId: MarkerId('FamilyStudentHousing'),
      position: LatLng(36.991927960465915, -122.06678385499028),
      infoWindow: InfoWindow(
        title: 'Family Student Housing',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Oaks College
    allMarkers.add(Marker(
      markerId: MarkerId('OaksCollegeStop'),
      position: LatLng(36.99081732602527, -122.06616193340405),
      infoWindow: InfoWindow(
        title: 'Oaks College',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // Oaks College 2
    allMarkers.add(Marker(
      markerId: MarkerId('OaksCollegeStop'),
      position: LatLng(36.990094987857034, -122.06727081180792),
      infoWindow: InfoWindow(
        title: 'Oaks College',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );

    // West Remote Lot
    allMarkers.add(Marker(
      markerId: MarkerId('WestRemoteRot'),
      position: LatLng(36.98880072878589, -122.06482455918103),
      infoWindow: InfoWindow(
        title: 'West Remote Lot',
        // snippet: '6 College Eight Service Rd, Santa Cruz, CA 95064',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Stops'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(36.989043, -122.058611),
              zoom: 14.35,
            ),
            markers: Set.from(allMarkers),
          ),
        ),
      ),
    );
  }
}
