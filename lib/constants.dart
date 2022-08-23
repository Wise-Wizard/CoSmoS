import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/info_screen.dart';

SizedBox kSpacing = const SizedBox(
  height: 25,
);

String kRoverFact1 = """
Curiosity, also called Mars Science Laboratory (MSL), U.S. robotic vehicle, designed to explore the surface of Mars, which determined that Mars was once capable of supporting life.
The rover was launched by an Atlas V rocket from Cape Canaveral, Florida, on November 26, 2011, and landed in Gale crater on Mars on August 6, 2012.
Curiosity is about 3 metres (10 feet) long and weighs about 900 kg (2,000 pounds), which makes it the longest and heaviest rover on Mars.
By contrast, the Mars Exploration Rovers, Spirit and Opportunity, are 1.6 metres [5.2 feet] long and weigh 174 kg [384 pounds].""";

String kRoverFact2 = """
Curiosity found that early Mars could have supported life.
It also found traces of organic molecules preserved in rock layers 3.5 billion years old and that the amount of methane in the Martian atmosphere varies with the seasons.
Curiosity carries several experiments that probe the Martian environment.
A neutron-beam generator provided by the Russian Federal Space Agency can detect water ice down to two metres (six feet) below the surface.
The Spanish Center for Astrobiology supplied Curiosity’s weather station. 
The largest experiment, the Sample Analysis at Mars, consists of a mass spectrometer, a gas chromatograph, and a laser spectrometer that search for carbon-containing compounds.
Curiosity also has several cameras, one of which takes high-definition video at a rate of 10 frames per second. """;

String kBackgroundImage =
    "https://cdn.pixabay.com/photo/2017/02/08/12/46/moon-2048727__340.jpg";

class ImageCard extends StatelessWidget {
  final String imageUrl;
  const ImageCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: const Color(0xFFE84545),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image(
          height: 350,
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

class ImageDescription extends StatelessWidget {
  const ImageDescription({
    Key? key,
    required this.imageUrl,
    required this.theory,
  }) : super(key: key);

  final String imageUrl;
  final String theory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ImageCard(imageUrl: imageUrl),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: const Color(0xFF53354A),
          elevation: 15,
          context: context,
          builder: (context) => Info(
            text: theory,
          ),
        );
      },
    );
  }
}
