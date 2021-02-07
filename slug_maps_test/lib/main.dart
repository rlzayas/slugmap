import 'package:flutter/material.dart';
import 'package:testing_app/widgets/slugTitle.dart';


void main() {
  runApp(SlugApp());
}

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


