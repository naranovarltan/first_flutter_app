import 'package:flutter/material.dart';
import 'package:first_flutter_app/pages/landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primaryColor: Colors.black),
      home: LandingPage(),
    );
  }
}
