import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/controller/http_controller.dart';
import 'package:weather_app/models/query_model.dart';
import 'package:weather_app/utils/hexcolor.dart';
import 'package:weather_app/widgets/bottom_nav.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/utils/color.dart';

import 'fragments/home_fragment.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  int pageIndex = 0;
  bool isLoading = true;
  final Color _color3 = HexColor("#73B3FF");
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  late Future<Welcome> futurestock;
  String date = DateTime.now().toString();
  static const List<Widget> pages = [
    HomeFragment(),
    HomeFragment(),
    HomeFragment(),
  ];
  void stateRefresh(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    futurestock = HttpController().fetchWeather(
        globalController.getLatitude().value,
        globalController.getLongitude().value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            // child: Text(
            //   "Sky Sense",
            //   style: TextStyle(fontSize: 21),
            // ),
          ),
          actions: [
            PopupMenuButton(
                icon: SvgPicture.asset(
                  'assets/icons/popup-down.svg',
                  color: Colors.black,
                ),
                color: Color(0xff453D99),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                splashRadius: 20,
                iconSize: 28,
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 1,
                        child: Text(
                          "settings",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text(
                          "share",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ])
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FutureBuilder<Welcome>(
                future: futurestock,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const HeaderWidget(),
                              Text(
                                snapshot.data!.cityName,
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${snapshot.data!.data[0].temp} °C",
                                style: const TextStyle(
                                    fontSize: 63, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                snapshot.data!.data[0].weather.description
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              pages.elementAt(pageIndex)
                            ]),
                      ),
                    );
                  } else if (snapshot.hasError) {
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
          ),
        ),
      ),
      bottomNavigationBar:
          createBottomNavigationBar(pageIndex, context, stateRefresh),
    );
  }
}
