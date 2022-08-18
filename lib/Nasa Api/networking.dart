// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = 'U4lKvtEFQyuvrznczUKmt7exc4rUECKdKhlysgfD';

class Networking {
  final String url;
  final String date;
  final String ver;
  Networking({required this.url, this.date = '', this.ver = ''});
  Future getDatum() async {
    Uri uri = Uri();
    //Mars Weather API
    if (ver == '1.0') {
      uri = Uri.https('api.nasa.gov', url, {
        'api_key': apiKey,
        'feedtype': 'json',
        'ver': ver,
      });
    }
    //APOD Screen API
    else if (date == '') {
      uri = Uri.https(
        'api.nasa.gov',
        url,
        {'api_key': apiKey},
      );
    }
    //MARS Rover API
    else {
      uri = Uri.https(
        'api.nasa.gov',
        url,
        {'earth_date': date, 'api_key': apiKey},
      );
    }
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
