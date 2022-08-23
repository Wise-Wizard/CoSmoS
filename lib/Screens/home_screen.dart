import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/apod_screen.dart';
import 'package:flutter_application_1/Screens/mars_rover_screen.dart';
import 'package:flutter_application_1/constants.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'Home Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(kBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Welcome To  ',
                        speed: const Duration(milliseconds: 100),
                        textStyle: const TextStyle(fontSize: 60)),
                  ],
                  repeatForever: true,
                  pause: const Duration(seconds: 5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Our CoSmoS!!',
                        speed: const Duration(milliseconds: 100),
                        textStyle: const TextStyle(fontSize: 60)),
                  ],
                  repeatForever: true,
                  pause: const Duration(seconds: 5),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, APODScreen.id);
                  },
                  color: const Color(0xFF94908D),
                  child: const Text(
                    'Nasa\'s APOD',
                    style: TextStyle(fontSize: 45, color: Color(0xFF53354A)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MarsRover.id);
                  },
                  color: const Color(0xFF94908D),
                  child: const Text(
                    'Mars Rover',
                    style: TextStyle(color: Color(0xFF53354A), fontSize: 45),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
