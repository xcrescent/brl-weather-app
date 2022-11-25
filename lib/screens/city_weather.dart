import 'package:flutter/material.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/openweathermodel.dart';
import 'package:weather_app/widgets/list_widget.dart';

class CityWeather extends StatefulWidget {
  const CityWeather({super.key, required this.city});
  final String city;
  @override
  State<CityWeather> createState() => _CityWeatherState();
}

class _CityWeatherState extends State<CityWeather> {
  late Future<Welcome> futureTemp;
  late Future<WelcomeDaily> futureDaily;
  @override
  void initState() {
    super.initState();
    futureTemp = HttpController().fetchHourlyWeatherForecastbyCity(widget.city);
    futureDaily = HttpController().fetchDailyWeatherForecastbyCity(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(widget.city,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Today",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    hourlyList(futureTemp, "current"),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Next Days",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    dailyList(futureDaily, "current"),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
