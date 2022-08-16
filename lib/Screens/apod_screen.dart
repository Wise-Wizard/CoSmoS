// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Nasa%20Api/networking.dart';
import 'apod_info_screen.dart';
import 'package:flutter_application_1/constants.dart';

class APODScreen extends StatefulWidget {
  static String id = 'APOD Screen';
  @override
  State<APODScreen> createState() => _APODScreenState();
}

class _APODScreenState extends State<APODScreen> {
  String titletext = '';
  String imageUrl = '';
  String theory = '';
  void getData() async {
    Networking apodNetwork = Networking(url: '/planetary/apod');
    var apodData = await apodNetwork.getPicture();
    setState(() {
      titletext = apodData['title'];
      imageUrl = apodData['url'];
      theory = apodData['explanation'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B2E4A),
      appBar: AppBar(
        backgroundColor: Color(0xFF53354A),
        elevation: 15,
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Astronomical Picture Of The Day',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kSpacing,
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Text(
              titletext,
              style:
                  TextStyle(fontSize: 45, decoration: TextDecoration.underline),
            ),
          ),
          kSpacing,
          ImageDescription(imageUrl: imageUrl, theory: theory),
        ],
      ),
    );
  }
}
