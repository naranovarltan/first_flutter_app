import 'package:first_flutter_app/pages/auth.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;

    return isLoggedIn ? HomePage() : AuthrizationPage();
  }
}
