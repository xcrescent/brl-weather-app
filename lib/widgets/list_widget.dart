import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/query_model.dart';
import 'package:weather_app/utils/color.dart';

Widget hourlyList(Future<Welcome> futureTemp) {
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
                    return
                        // Obx(((() => GestureDetector(
                        //       onTap: (() {
                        //         // cardIndex.value = index;
                        //       }),
                        //       child:
                        Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
                        day: snapshot.data!.data[index].temp.toInt(),
                        temp: snapshot.data!.data[index].temp.toInt(),
                        weatherIcon: "",
                      ),
                    );
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
  const HourlyDetails(
      {super.key,
      required this.day,
      required this.temp,
      required this.weatherIcon});

  final int temp;
  final int day;
  final String weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(temp.toString()),
          ],
        ),
      ),
    );
  }
}
