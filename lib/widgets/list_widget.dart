import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/openweathermodel.dart';
import 'package:weather_app/utils/color.dart';

bool _showWeather = true;
Widget hourlyList(Future<Welcome> futureTemp, typeweather) {
  int itemCount = 16;
  if (typeweather == "current") {
    itemCount = 24;
  }
  return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: FutureBuilder<Welcome>(
          future: futureTemp,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCount,
                  itemBuilder: ((context, index) {
                    _showWeather = true;
                    if (_showWeather) {
                      return
                          // Obx(((() => GestureDetector(
                          //       onTap: (() {
                          //         // cardIndex.value = index;
                          //       }),
                          //       child:
                          Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: const LinearGradient(colors: [
                              CustomColors.firstGradientColor,
                              CustomColors.secondGradientColor,
                            ]),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0.5, 0),
                                blurRadius: 30,
                                spreadRadius: 1,
                                color: CustomColors.dividerLine.withAlpha(150),
                              )
                            ]),
                        child: HourlyDetails(
                          type: typeweather,
                          time: snapshot.data!.list[index].dtTxt,
                          temp: snapshot.data!.list[index].main.temp.toInt(),
                          humidity:
                              snapshot.data!.list[0].main.humidity.toInt(),
                          weatherIcon:
                              snapshot.data!.list[index].weather[0].icon,
                        ),
                      );
                    } else {
                      return HourlyDetails(
                        type: typeweather,
                        time: snapshot.data!.list[index].dtTxt,
                        temp: snapshot.data!.list[index].main.temp.toInt(),
                        humidity: snapshot.data!.list[0].main.humidity.toInt(),
                        weatherIcon: snapshot.data!.list[index].weather[0].icon,
                      );
                    }
                  }));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [CircularProgressIndicator()]);

            // ))));
          }));
}

class HourlyDetails extends StatelessWidget {
  HourlyDetails(
      {super.key,
      required this.type,
      required this.time,
      required this.temp,
      required this.humidity,
      required this.weatherIcon});
  final String type;
  final int temp;
  final DateTime time;
  final String weatherIcon;
  late String timehour;
  final int humidity;

  @override
  Widget build(BuildContext context) {
    _showWeather = true;
    if (time.hour < 10) {
      timehour = '0${time.hour}';
    } else {
      timehour = time.hour.toString();
    }
    if (DateTime.now().day == time.day && type == "current") {
      return Container(
        // decoration: BoxDecoration(
        //   border: BoxBorder.lerp(a, b, t)
        // ),
        padding: const EdgeInsets.all(8),
        width: 59,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Text(
                "$timehour:${time.minute}0",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Image.asset('assets/weather/$weatherIcon.png', scale: 0.5),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${temp.toString()} °C",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (DateTime.now().day != time.day && type == "week") {
      return Container(
        padding: const EdgeInsets.all(8),
        width: 59,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Text(
                "$timehour:${time.minute}0",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Image.asset('assets/weather/$weatherIcon.png', scale: 0.5),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${humidity.toString()}%",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${temp.toString()} °C",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      _showWeather = false;
      return const Text("");
    }
  }
}

Widget dailyList(Future<WelcomeDaily> futureTemp, typeweather) {
  int itemCount = 16;
  if (typeweather == "current") {
    itemCount = 24;
  }
  return Container(
      height: 180,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: FutureBuilder<WelcomeDaily>(
          future: futureTemp,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.list.length,
                  itemBuilder: ((context, index) {
                    _showWeather = true;
                    // if (_showWeather) {
                    return
                        // Obx(((() => GestureDetector(
                        //       onTap: (() {
                        //         // cardIndex.value = index;
                        //       }),
                        //       child:
                        Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor,
                          ]),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0.5, 0),
                              blurRadius: 30,
                              spreadRadius: 1,
                              color: CustomColors.dividerLine.withAlpha(150),
                            )
                          ]),
                      child: DailyDetails(
                        type: typeweather,
                        date: snapshot.data!.list[index].dt,
                        tempMin: snapshot.data!.list[index].temp.min.toInt(),
                        tempMax: snapshot.data!.list[index].temp.max.toInt(),
                        humidity: snapshot.data!.list[0].humidity.toInt(),
                        weatherIcon: snapshot.data!.list[index].weather[0].icon,
                      ),
                    );
                  }
                      // else {
                      //   return DailyDetails(
                      //     type: typeweather,
                      //     time: snapshot.data!.list[index].dt,
                      //     temp: snapshot.data!.list[index].main.temp.toInt(),
                      //     humidity: snapshot.data!.list[0].main.humidity.toInt(),
                      //     weatherIcon: snapshot.data!.list[index].weather[0].icon,
                      //   );
                      // }
                      // }
                      ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [CircularProgressIndicator()]);

            // ))));
          }));
}

class DailyDetails extends StatelessWidget {
  DailyDetails(
      {super.key,
      required this.type,
      required this.date,
      required this.tempMin,
      required this.tempMax,
      required this.humidity,
      required this.weatherIcon});
  final String type;
  final int tempMin;
  final int tempMax;
  final int date;
  final String weatherIcon;
  // late String timehour;
  final int humidity;
  String getDay(day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    var x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    _showWeather = true;
    // if (time.hour < 10) {
    //   timehour = '0${time.hour}';
    // } else {
    //   timehour = time.hour.toString();
    // }
    // if (DateTime.now().day == time.day && type == "current") {
    return Container(
      // decoration: BoxDecoration(
      //   border: BoxBorder.lerp(a, b, t)
      // ),
      padding: const EdgeInsets.all(8),
      width: 69,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              getDay(date),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Image.asset('assets/weather/$weatherIcon.png', scale: 4),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${humidity.toString()}%",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${tempMin.toString()}~${tempMax.toString()} °C",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
    // } else if (DateTime.now().day != time.day && type == "week") {
    // return Container(
    //   padding: const EdgeInsets.all(8),
    //   width: 59,
    //   child: Center(
    //     child: Column(
    //       children: [
    //         const SizedBox(
    //           height: 7,
    //         ),
    //         Text(
    //           "$timehour:${time.minute}0",
    //           style: TextStyle(
    //             fontFamily: 'Poppins',
    //             fontSize: 13,
    //             color: Colors.white,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 8,
    //         ),
    //         Image.asset('assets/weather/$weatherIcon.png', scale: 0.5),
    //         const SizedBox(
    //           height: 4,
    //         ),
    //         Text(
    //           "${humidity.toString()}%",
    //           style: const TextStyle(
    //             fontFamily: 'Poppins',
    //             fontSize: 12,
    //             color: Colors.white,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 4,
    //         ),
    //         Text(
    //           "${temp.toString()} °C",
    //           style: TextStyle(
    //             fontFamily: 'Poppins',
    //             fontSize: 12,
    //             color: Colors.white,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    // } else {
    //   _showWeather = false;
    //   return const Text("");
    // }
  }
}
