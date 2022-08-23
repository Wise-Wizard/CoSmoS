// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Nasa Api/networking.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MarsRover extends StatefulWidget {
  static String id = 'Mars Rover';

  const MarsRover({Key? key}) : super(key: key);

  @override
  State<MarsRover> createState() => _MarsRoverState();
}

class _MarsRoverState extends State<MarsRover> {
  String Date = '2020-08-08';
  String frontImageUrl = '';
  String rearImageUrl = '';
  void getData() async {
    Networking roverNetwork = Networking(
        url: '/mars-photos/api/v1/rovers/curiosity/photos', date: Date);
    var roverData = await roverNetwork.getDatum();
    setState(() {
      frontImageUrl = roverData['photos'][1]['img_src'];
      rearImageUrl = roverData['photos'][2]['img_src'];
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
      backgroundColor: const Color(0xFF2B2E4A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF53354A),
        elevation: 15,
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Mars Rover: Curiosity',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: frontImageUrl == ''
            ? const SpinKitPouringHourGlassRefined(
                size: 200, color: Color(0xFFE84545))
            : RoverWidget(),
      ),
    );
  }

  ListView RoverWidget() {
    return ListView(
      children: [
        kSpacing,
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: DateTimePicker(
            firstDate: DateTime(2013),
            lastDate: DateTime.now(),
            decoration: const InputDecoration(
              icon: Icon(
                Icons.edit_calendar_sharp,
                size: 50,
              ),
              contentPadding: EdgeInsets.only(left: 35),
              hintText: 'Enter Date:',
            ),
            style: const TextStyle(fontSize: 45, color: Colors.white),
            onChanged: (newValue) {
              setState(() {
                Date = newValue;
                getData();
              });
            },
          ),
        ),
        kSpacing,
        Padding(
          padding: EdgeInsets.all(8.0),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Front Hazard Avoidance Camera',
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontSize: 35),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        ImageDescription(imageUrl: frontImageUrl, theory: kRoverFact1),
        kSpacing,
        Padding(
          padding: EdgeInsets.all(8.0),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Rear Hazard Avoidance Camera',
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontSize: 35),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
        ImageDescription(imageUrl: rearImageUrl, theory: kRoverFact2)
      ],
    );
  }
}
