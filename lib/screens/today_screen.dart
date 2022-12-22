import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/openweathermodel.dart';
import 'package:weather_app/screens/additional/settings.dart';
import 'package:weather_app/utils/hexcolor.dart';
import 'package:weather_app/widgets/list_widget.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key, required this.listSwitch});
  final bool listSwitch;
  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  late Future<Welcome> futureTemp;
  late Future<WelcomeDaily> futureDailyWeather;
  late bool listSwitch;
  @override
  void initState() {
    super.initState();
    listSwitch = widget.listSwitch;
    futureTemp = HttpController().fetchHourlyWeatherForecast(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
    futureDailyWeather = HttpController().fetchDailyWeatherForecast(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
  }

  void stateRefresh(index) {
    setState(() {});
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
            // color: Colors.white,
            padding: const EdgeInsets.only(top: 94),
            child: Swipe(
              onSwipeDown: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    HexColor("#82BAFB"),
                    HexColor("#82BAFB"),
                    HexColor("#D8EAFF"),
                  ], center: Alignment.center, focalRadius: 100, radius: 20),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: <BoxShadow>[
                    for (int i = 0; i < 5; i++)
                      BoxShadow(
                          blurRadius: 40,
                          blurStyle: BlurStyle.inner,
                          color: HexColor("#D8EAFF"),
                          spreadRadius: 0 + i * 10),
                    for (int i = 0; i < 4; i++)
                      BoxShadow(
                          blurRadius: 50,
                          blurStyle: BlurStyle.inner,
                          color: HexColor("#D8EAFF"),
                          spreadRadius: (5 + i) * 10),
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
                    for (int i = 1; i < 5; i++)
                      BoxShadow(
                          blurRadius: 40,
                          blurStyle: BlurStyle.outer,
                          color: HexColor("#82BAFB"),
                          spreadRadius: i * 10),
                    for (int i = 0; i < 4; i++)
                      BoxShadow(
                          blurRadius: 50,
                          blurStyle: BlurStyle.outer,
                          color: HexColor("#82BAFB"),
                          spreadRadius: (5 + i) * 10),
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
                        listSwitch
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Today",
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          listSwitch = false;
                                        });
                                        // Navigator.pushReplacementNamed(
                                        //     context, '/this_week');
                                      },
                                      child: const Text(
                                        "This Week",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () => setState(() {
                                        listSwitch = true;
                                      }),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 24),
                              alignment: Alignment.center,
                              child: const Text(
                                "",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            listSwitch
                                ? hourlyList(futureTemp, "current")
                                : dailyList(futureDailyWeather, "week"),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                height: 300,
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
                                padding: const EdgeInsets.only(
                                    top: 32, left: 36, right: 36),
                                child: listSwitch
                                    ? FutureBuilder<Welcome>(
                                        future: futureTemp,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Column(
                                              children: [
                                                const Text(
                                                  "Current Weather",
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4),
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/thermometer-quarter.svg',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  tempUnit == SingingCharacter.celsius
                                                                  ?Text(
                                                                    '${snapshot.data!.list[0].main.feelsLike.toInt()}°C',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ):Text(
                                                                    '${snapshot.data!.list[0].main.feelsLike.toInt()}°F',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    "Feels like",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 40,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/ic_baseline-water-drop.svg',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${snapshot.data!.list[0].main.humidity.toInt()}%",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    "Humidity",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/eye.svg',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${snapshot.data!.list[0].visibility.toInt() / 1000} km",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    "Visibility",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 40,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/cloudscale.svg',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${snapshot.data!.list[0].main.pressure.toInt()} hPa",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    "Air Pressure",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100,
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/windspeed...svg',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${snapshot.data!.list[0].wind.speed} km/h",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    "Wind",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     Column(
                                                        //       crossAxisAlignment:
                                                        //           CrossAxisAlignment.start,
                                                        //       children: [
                                                        //         Text(
                                                        //           snapshot.data!.list[0].main
                                                        //               .feelsLike
                                                        //               .toInt()
                                                        //               .toString(),
                                                        //         ),
                                                        //         const Text("Dew point"),
                                                        //       ],
                                                        //     )
                                                        //   ],
                                                        // )
                                                      ],
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Text("Error Fetching");
                                            // Text('${snapshot.error}');
                                          }
                                          return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                CircularProgressIndicator()
                                              ]);
                                        },
                                      )
                                    : const Text(
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
      ),
    );
  }
}
