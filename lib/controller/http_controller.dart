import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/query_model.dart';

class HttpController {
  Future<Welcome> fetchWeather(latitude, longitude) async {
    final response = await http.get(Uri.parse(
        'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=$latitude&lon=$longitude'),headers: {
    'X-RapidAPI-Key': '78d83b60c8mshe5f3c4b35aa6bc2p131eb3jsne0ebd6ea2f41',
    'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
  });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(jsonDecode(response.body));
      print(jsonDecode(response.body));
      return Welcome.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
