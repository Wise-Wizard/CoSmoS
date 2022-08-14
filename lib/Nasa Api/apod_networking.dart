// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = 'U4lKvtEFQyuvrznczUKmt7exc4rUECKdKhlysgfD';

class APODNetworking {
  Future getPicture() async {
    Uri uri = Uri.https(
      'api.nasa.gov',
      '/planetary/apod',
      {'api_key': apiKey},
    );
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
