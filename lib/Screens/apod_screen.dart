// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Nasa%20Api/networking.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    var apodData = await apodNetwork.getDatum();
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
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: imageUrl == ''
              ? SpinKitPouringHourGlassRefined(
                  color: Color(0xFFE84545),
                  size: 200,
                )
              : APODWidget(
                  titletext: titletext, imageUrl: imageUrl, theory: theory),
        ));
  }
}

class APODWidget extends StatelessWidget {
  const APODWidget({
    Key? key,
    required this.titletext,
    required this.imageUrl,
    required this.theory,
  }) : super(key: key);

  final String titletext;
  final String imageUrl;
  final String theory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kSpacing,
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            titletext,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 35, decoration: TextDecoration.underline),
          ),
        ),
        kSpacing,
        ImageDescription(imageUrl: imageUrl, theory: theory)
      ],
    );
  }
}
