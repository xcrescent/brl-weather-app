import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/query_model.dart';
import 'package:weather_app/utils/hexcolor.dart';
import 'package:weather_app/widgets/list_widget.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  late Future<Welcome> futurestock;

  @override
  void initState() {
    super.initState();
    futurestock = HttpController().fetchWeather(
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
                  blurRadius: 30,
                  blurStyle: BlurStyle.inner,
                  color: HexColor("#82BAFB"),
                ),
                BoxShadow(
                  blurRadius: 30,
                  blurStyle: BlurStyle.inner,
                  color: HexColor("#D8EAFF"),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "This week",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
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
                        hourlyList(futurestock),
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
                            child: const Text("Current Weather"),
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
    );
  }
}
