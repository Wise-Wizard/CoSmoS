import 'package:flutter/material.dart';
import 'package:flutter_application_1/Nasa Api/networking.dart';

class MarsRover extends StatefulWidget {
  static String id = 'Mars Rover';
  const MarsRover({Key? key}) : super(key: key);

  @override
  State<MarsRover> createState() => _MarsRoverState();
}

class _MarsRoverState extends State<MarsRover> {
  void getData() async {
    Networking roverNetwork =
        Networking(url: '/mars-photos/api/v1/rovers/curiosity/photos');
    var roverData = roverNetwork.getPicture();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
