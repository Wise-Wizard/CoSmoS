import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/apod_screen.dart';
import 'package:flutter_application_1/Screens/home_screen.dart';
import 'package:flutter_application_1/Screens/mars_rover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'EBGaramond'),
      home: APODScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        APODScreen.id: (context) => APODScreen(),
        MarsRover.id: (context) => MarsRover(),
      },
    );
  }
}
