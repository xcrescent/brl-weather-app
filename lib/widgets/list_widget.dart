import 'package:flutter/material.dart';
import 'package:weather_app/models/openweathermodel.dart';
import 'package:weather_app/utils/color.dart';

bool _showWeather = true;
Widget hourlyList(Future<Welcome> futureTemp, typeweather) {
  return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: FutureBuilder<Welcome>(
          future: futureTemp,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 40,
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
                          weatherIcon:
                              snapshot.data!.list[index].weather[0].icon,
                        ),
                      );
                    } else {
                      return HourlyDetails(
                          type: typeweather,
                          time: snapshot.data!.list[index].dtTxt,
                          temp: snapshot.data!.list[index].main.temp.toInt(),
                          weatherIcon:
                              snapshot.data!.list[index].weather[0].icon,
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
      required this.weatherIcon});
  final String type;
  final int temp;
  final DateTime time;
  final String weatherIcon;
  late String timehour;

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
        padding: const EdgeInsets.all(8),
        width: 59,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text("$timehour:${time.minute}0"),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/weather/$weatherIcon.png', scale: 0.5),
              const SizedBox(
                height: 10,
              ),
              Text("${temp.toString()} °C"),
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
                height: 10,
              ),
              Text("$timehour:${time.minute}0"),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/weather/$weatherIcon.png', scale: 0.5),
              const SizedBox(
                height: 10,
              ),
              Text("${temp.toString()} °C"),
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
