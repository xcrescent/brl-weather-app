import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/openweathermodel.dart';
import 'package:weather_app/utils/hexcolor.dart';
import 'package:weather_app/widgets/bottom_nav.dart';
import 'package:weather_app/widgets/list_widget.dart';

class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  // RxInt cardIndex = GlobalController()
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  late Future<WelcomeDaily> futureDailyWeather;

  @override
  void initState() {
    super.initState();
    futureDailyWeather = HttpController().fetchDailyWeatherForecast(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Swipe(
          onSwipeDown: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: FractionalOffset.bottomCenter,
            color: Colors.white,
            padding: const EdgeInsets.only(top: 94),
            child: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  HexColor("#82BAFB"),
                  HexColor("#D8EAFF"),
                ], center: Alignment.center, focalRadius: 100, radius: 20),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.inner,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 0),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.inner,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 10),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.inner,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 20),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.inner,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 30),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.inner,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 40),
                  BoxShadow(
                      blurRadius: 50,
                      blurStyle: BlurStyle.inner,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 50),
                  BoxShadow(
                      blurRadius: 50,
                      blurStyle: BlurStyle.inner,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 60),
                  BoxShadow(
                    blurRadius: 50,
                    blurStyle: BlurStyle.inner,
                    color: HexColor("#D8EAFF"),
                    spreadRadius: 70,
                  ),
                  BoxShadow(
                    blurRadius: 50,
                    blurStyle: BlurStyle.inner,
                    color: HexColor("#D8EAFF"),
                    spreadRadius: 80,
                  ),
                  BoxShadow(
                    blurRadius: 100,
                    blurStyle: BlurStyle.inner,
                    color: HexColor("#D8EAFF"),
                    spreadRadius: 90,
                  ),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.normal,
                      color: HexColor("#82BAFB"),
                      spreadRadius: 10),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.outer,
                      color: HexColor("#D8EAFF"),
                      spreadRadius: 0),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.outer,
                      color: HexColor("#82BAFB"),
                      spreadRadius: 10),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.outer,
                      color: HexColor("#82BAFB"),
                      spreadRadius: 20),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.outer,
                      color: HexColor("#82BAFB"),
                      spreadRadius: 30),
                  BoxShadow(
                      blurRadius: 40,
                      blurStyle: BlurStyle.outer,
                      color: HexColor("#82BAFB"),
                      spreadRadius: 40),
                  BoxShadow(
                      blurRadius: 50,
                      blurStyle: BlurStyle.outer,
                      color: HexColor("#82BAFB"),
                      spreadRadius: 50),
                  BoxShadow(
                      blurRadius: 50,
                      blurStyle: BlurStyle.outer,
                      color: HexColor("#82BAFB"),
                      spreadRadius: 60),
                  BoxShadow(
                    blurRadius: 50,
                    blurStyle: BlurStyle.outer,
                    color: HexColor("#82BAFB"),
                    spreadRadius: 70,
                  ),
                  BoxShadow(
                    blurRadius: 50,
                    blurStyle: BlurStyle.outer,
                    color: HexColor("#82BAFB"),
                    spreadRadius: 80,
                  ),
                  BoxShadow(
                    blurRadius: 100,
                    blurStyle: BlurStyle.outer,
                    color: HexColor("#82BAFB"),
                    spreadRadius: 90,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushReplacementNamed(
                                  context, '/today'),
                              child: const Text(
                                "Today",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "This Week",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            alignment: Alignment.center,
                            child: const Text(
                              "",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          dailyList(futureDailyWeather, "week"),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 172,
                              decoration: BoxDecoration(
                                color: const Color(0Xff5683D2),
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              // decoration: BoxDecoration(
                              //   boxShadow: [
                              //     BoxShadow(
                              //       blurRadius: 20,
                              //       color: Colors.white,
                              //     ),
                              //   ]
                              // ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(40),
                              child: const Text(
                                "Weather Forecast",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
