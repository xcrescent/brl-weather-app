import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/openweathermodel.dart';
import 'package:weather_app/screens/additional/settings.dart';

// 'X-RapidAPI-Key': '78d83b60c8mshe5f3c4b35aa6bc2p131eb3jsne0ebd6ea2f41',
// 'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
class HttpController {
  Future<WelcomeCurrent> fetchWeatherCurrent(double lat, double lon) async {
    
    // print(lat + lon);
    // final response = await http.get(Uri.parse(
    //     'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=$latitude&lon=$longitude'),headers: {

    // 'X-RapidAPI-Key':
    //           '01c2ba1c7cmshbcf4163cbfc9e28p1f846ajsn6d7542a40d6a',
    //       'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
    // });
    var unit = 'metric';
    if (tempUnit == SingingCharacter.fahrenheit) {
      unit = 'imperial';
    }
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=8476478bea8d6ea40c4a303496f86447&units=$unit'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonDecode(response.body));
      // print(jsonDecode(response.body));
      return OpenWeatherCurrentFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<WelcomeDaily> fetchDailyWeatherForecast(double lat, double lon) async {
    // print(lat + lon);
    // final response = await http.get(Uri.parse(
    //     'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=$latitude&lon=$longitude'),headers: {

    // 'X-RapidAPI-Key':
    //           '01c2ba1c7cmshbcf4163cbfc9e28p1f846ajsn6d7542a40d6a',
    //       'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
    // });
    var unit = 'metric';
    if (tempUnit == SingingCharacter.fahrenheit) {
      unit = 'imperial';
    }
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?lat=$lat&lon=$lon&appid=8476478bea8d6ea40c4a303496f86447&units=$unit'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonDecode(response.body));
      // print(jsonDecode(response.body));
      return welcomeDailyFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Welcome> fetchHourlyWeatherForecast(double lat, double lon) async {
    // print(lat + lon);
    // final response = await http.get(Uri.parse(
    //     'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=$latitude&lon=$longitude'),headers: {

    // 'X-RapidAPI-Key':
    //           '01c2ba1c7cmshbcf4163cbfc9e28p1f846ajsn6d7542a40d6a',
    //       'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
    // });
    var unit = 'metric';
    if (tempUnit == SingingCharacter.fahrenheit) {
      unit = 'imperial';
    }
    final response = await http.get(Uri.parse(
        'https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=$lat&lon=$lon&appid=8476478bea8d6ea40c4a303496f86447&units=$unit'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonDecode(response.body));
      // print(jsonDecode(response.body));
      return openWeatherForecastFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Welcome> fetchHourlyWeatherForecastbyCity(String cityName) async {
    // print(lat + lon);
    // final response = await http.get(Uri.parse(
    //     'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=$latitude&lon=$longitude'),headers: {

    // 'X-RapidAPI-Key':
    //           '01c2ba1c7cmshbcf4163cbfc9e28p1f846ajsn6d7542a40d6a',
    //       'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
    // });
    var unit = 'metric';
    if (tempUnit == SingingCharacter.fahrenheit) {
      unit = 'imperial';
    }
    final response = await http.get(Uri.parse(
        'https://pro.openweathermap.org/data/2.5/forecast/hourly?q=$cityName&appid=8476478bea8d6ea40c4a303496f86447&units=$unit'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonDecode(response.body));
      // print(jsonDecode(response.body));
      return openWeatherForecastFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<WelcomeDaily> fetchDailyWeatherForecastbyCity(String cityName) async {
    // print(lat + lon);
    // final response = await http.get(Uri.parse(
    //     'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=$latitude&lon=$longitude'),headers: {

    // 'X-RapidAPI-Key':
    //           '01c2ba1c7cmshbcf4163cbfc9e28p1f846ajsn6d7542a40d6a',
    //       'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
    // });
    var unit = 'metric';
    if (tempUnit == SingingCharacter.fahrenheit) {
      unit = 'imperial';
    }
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=8476478bea8d6ea40c4a303496f86447&units=$unit'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonDecode(response.body));
      // print(jsonDecode(response.body));
      return welcomeDailyFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Cities> getCityFunc(String cityName) async {
    if (cityName == '') {
      cityName = 'ghaz';
    }
    final response = await http.get(Uri.parse(
        'https://us-central1-elitevidproj.cloudfunctions.net/getCity/$cityName'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // log(jsonDecode(response.body));
      // print(jsonDecode(response.body));
      return Cities.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Cities {
  Cities({
    required this.city,
  });

  List<String> city;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        city: List<String>.from(json["city"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "city": List<dynamic>.from(city.map((x) => x)),
      };
}
