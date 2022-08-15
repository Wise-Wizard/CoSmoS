// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Nasa%20Api/networking.dart';

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
        elevation: 20,
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          'Astronomical Picture Of The Day',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                color: Color(0xFF2B2E4A),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      titletext,
                      style: TextStyle(
                          fontSize: 50, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xFFE84545),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image(
                    height: 300,
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
              Container(
                color: Color(0xFF2B2E4A),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    theory,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
