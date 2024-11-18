import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context,'/Main');
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash_screen.webp',
          width: 200,
        ),
      ),
    );
  }
}
