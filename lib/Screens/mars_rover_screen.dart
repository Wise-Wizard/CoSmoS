import 'package:flutter/material.dart';
import 'package:flutter_application_1/Nasa Api/networking.dart';

class MarsRover extends StatefulWidget {
  static String id = 'Mars Rover';
  const MarsRover({Key? key}) : super(key: key);

  @override
  State<MarsRover> createState() => _MarsRoverState();
}

class _MarsRoverState extends State<MarsRover> {
  String frontImageUrl = '';
  String rearImageUrl = '';
  void getData() async {
    Networking roverNetwork = Networking(
        url: '/mars-photos/api/v1/rovers/curiosity/photos', date: '2015-6-3');
    var roverData = await roverNetwork.getPicture();
    setState(() {
      frontImageUrl = roverData['photos'][1]['img_src'];
      rearImageUrl = roverData['photos'][2]['img_src'];
    });
    print(frontImageUrl);
    print(rearImageUrl);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
