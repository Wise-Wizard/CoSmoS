import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/apod_screen.dart';
import 'package:flutter_application_1/Screens/mars_rover_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'Home Screen';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MarsRover.id);
            },
            child: Text('APODScreen'))
      ],
    );
  }
}
