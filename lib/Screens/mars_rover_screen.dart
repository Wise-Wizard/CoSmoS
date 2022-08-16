import 'package:flutter/material.dart';
import 'package:flutter_application_1/Nasa Api/networking.dart';
import 'package:date_time_picker/date_time_picker.dart';

class MarsRover extends StatefulWidget {
  static String id = 'Mars Rover';
  const MarsRover({Key? key}) : super(key: key);

  @override
  State<MarsRover> createState() => _MarsRoverState();
}

class _MarsRoverState extends State<MarsRover> {
  String Date = '2022-08-08';
  String frontImageUrl = '';
  String rearImageUrl = '';
  void getData() async {
    Networking roverNetwork = Networking(
        url: '/mars-photos/api/v1/rovers/curiosity/photos', date: Date);
    var roverData = await roverNetwork.getPicture();
    setState(() {
      frontImageUrl = roverData['photos'][1]['img_src'];
      rearImageUrl = roverData['photos'][2]['img_src'];
    });
    print(frontImageUrl);
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
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: ListView(
        children: [
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
          const Text('data'),
          Image(image: NetworkImage(frontImageUrl)),
          const Text(''),
          Image(image: NetworkImage(rearImageUrl)),
        ],
      ),
    );
  }
}
