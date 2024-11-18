import 'package:flutter/material.dart';
import 'package:netflix_ui/Screen/MainScreen.dart';
import 'package:netflix_ui/Screen/splash_screen.dart';



void main() {
  runApp(ThemeApp());
}

class ThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(),
      home: SplashScreen(),
      routes: {

        '/Main': (context) => MainScreen(),

      },


    );
  }
}
