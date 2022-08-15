// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';

class APODinfo extends StatelessWidget {
  final String text;
  const APODinfo({required this.text});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Description',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 45,
              color: Color(0xFFE84545),
              decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
