// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Nasa%20Api/networking.dart';

class MarsWeather extends StatefulWidget {
  const MarsWeather({Key? key}) : super(key: key);
  static String id = 'Mars Weather';

  @override
  State<MarsWeather> createState() => _MarsWeatherState();
}

class _MarsWeatherState extends State<MarsWeather> {
  var sol_key;
  List weather_data = [];
  void getData() async {
    Networking weatherNetwork =
        Networking(url: '/insight_weather/', ver: '1.0');
    var marsWeather = await weatherNetwork.getDatum();
    setState(() {
      sol_key = marsWeather['sol_keys'];
      sol_key = sol_key.reversed.toList();
      for (int i = 0; i < sol_key.length; i++) {
        weather_data.add(marsWeather[sol_key[i]]['AT']);
      }
    });
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
