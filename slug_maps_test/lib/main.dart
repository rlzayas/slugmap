import 'package:flutter/material.dart';
import 'package:testing_app/widgets/slugTitle.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(SlugApp());
}

//Sizes in all are from iphone 11 pro
class SlugApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlugMaps',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: slugTitle(),
    );
  }
}


