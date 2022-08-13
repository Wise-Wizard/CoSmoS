// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class APODScreen extends StatelessWidget {
  const APODScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Astronomical Picture Of The Day',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
