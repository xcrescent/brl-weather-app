import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/openweathermodel.dart';
import 'dart:io';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  late Future<WelcomeCurrent> futureCurrentWeather;
  bool activeConnection = false;
  String T = "";

  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
          // T = "Turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        T = "Turn On the data and repress again";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    futureCurrentWeather = HttpController().fetchWeatherCurrent(
        globalController.getLatitude().value,
        globalController.getLongitude().value);
    checkUserConnection();
  }

  @override
  Widget build(BuildContext context) {
    return activeConnection
        ? Column(
            children: [
              FutureBuilder<WelcomeCurrent>(
                future: futureCurrentWeather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // const HeaderWidget(),
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${snapshot.data!.main.temp} °C",
                                style: const TextStyle(
                                    fontSize: 63, fontWeight: FontWeight.w600),
                              ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // Text(
                              //   '${snapshot.data!.main.tempMin}~${snapshot.data!.main.tempMax}',
                              //   style: const TextStyle(
                              //       fontSize: 16, fontWeight: FontWeight.w400),
                              // ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                snapshot.data!.weather[0].description
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Image.asset(
                                  'assets/weather/${snapshot.data!.weather[0].icon}.png')
                            ]),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    checkUserConnection();
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(child: CircularProgressIndicator())
                      ]);
                },
              ),
            ],
          )
        : const Center(
            child: Text("You are not connected to the Internet"),
          );
  }
}
