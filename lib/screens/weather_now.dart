import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/screens/additional/settings.dart';
import 'package:weather_app/screens/fragments/favourite_fragment.dart';
import 'package:weather_app/utils/hexcolor.dart';
import 'package:weather_app/widgets/bottom_nav.dart';
import 'package:weather_app/screens/additional/share_widget.dart';
import 'fragments/home_fragment.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  int pageIndex = 0;
  bool share = true;
  final Color _color3 = HexColor("#73B3FF");
  Uint8List? imageData;
  static const List<Widget> pages = [
    HomeFragment(),
    FavouriteFragment(),
  ];
  void stateRefresh(index) {
    setState(() {
      pageIndex = index;
      if (pageIndex != 0) {
        share = false;
      } else {
        share = true;
      }
    });
  }
  refresh (){
    setState(() {
      
    });
  }

  takeSS() async {
    RenderRepaintBoundary boundary = screenshotKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
        pixelRatio: 3.0); // by default pixel ratio is 1.0
    ByteData? byte = await image.toByteData(format: ui.ImageByteFormat.png);
    imageData = byte!.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/weather_ss.jpg').create();
    file.writeAsBytesSync(imageData!);
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>
          ShareWidget(directory: tempDir, imageData: imageData),
    ));
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  static GlobalKey screenshotKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: screenshotKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  'Greetings!!',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                setState(() {
                  pageIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Support'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                setState(() {
                  pageIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Close Drawer'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ]),
        ),
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
                  color: const Color(0xff453D99),
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  splashRadius: 20,
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SettingsScreen(),
                        ),
                      );
                    } else {
                      if (share) {
                        takeSS();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text("Go to the homescreen to share weather"),
                          backgroundColor: Color(0xff82BAFB),
                        ));
                      }
                    }
                  },
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
              child: pages.elementAt(pageIndex)),
        ),
        bottomNavigationBar: createBottomNavigationBar(
            pageIndex, context, stateRefresh, scaffoldKey),
      ),
    );
  }
}
