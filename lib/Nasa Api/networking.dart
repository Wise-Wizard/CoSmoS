// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = 'U4lKvtEFQyuvrznczUKmt7exc4rUECKdKhlysgfD';

class Networking {
  final String url;
  final String date;
  Networking({required this.url, this.date = ''});
  Future getPicture() async {
    Uri uri = Uri();
    if (date == '') {
      uri = Uri.https(
        'api.nasa.gov',
        url,
        {'api_key': apiKey},
      );
    } else {
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
