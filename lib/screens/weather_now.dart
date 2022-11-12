import 'package:flutter/material.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/query_model.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  bool isLoading = true;
  late Future<Welcome> futurestock;

  @override
  void initState() {
    super.initState();
    futurestock = HttpController().fetchWeather(35.5, -78.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder<Welcome>(
            future: futurestock,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.cityName);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
