import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipe/swipe.dart';
import 'package:weather_app/screens/fragments/favourite_fragment.dart';
import 'package:weather_app/screens/today_screen.dart';
import 'package:weather_app/utils/hexcolor.dart';

import '../screens/fragments/home_fragment.dart';

Widget createBottomNavigationBar(
    pageIndex, BuildContext context, func, scaffoldKey) {
  // ScrollController scrollController = ScrollController();
  // final double _initFabHeight = 120.0;
  // double _fabHeight = 0;
  // double _panelHeightOpen = 0;
  // double _panelHeightClosed = 95.0;
  return Swipe(
    //   // key: const Key("dis"),
    //   // controller: scrollController,
    //   // : ((direction) {
    //   // if (direction == DismissDirection.up) {
    //   // Navigator.pushNamed(context, '/today');
    //   // }
    //   // }),
    // maxHeight: _panelHeightOpen,
    // minHeight: _panelHeightClosed,
    // panelBuilder: (sc) => _panel(sc, context),
    // onPanelSlide: (double pos) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) =>
    //           const TodayScreen(listSwitch: true),
    //     ),
    //   );
    // },
    onSwipeUp: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              const TodayScreen(listSwitch: true),
        ),
      );
    },
    child: Container(
      height: 150,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [HexColor("#D8EAFF"), HexColor("#82BAFB")],
        //   begin: Alignment.topLeft,
        //   end: Alignment.topRight,
        //   // stops: [0.0, 0.8],
        //   tileMode: TileMode.repeated,
        // ),
        color: HexColor("#73B3FF"),

        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 50,
            color: HexColor("#82BAFB"),
          ),
          BoxShadow(
            blurRadius: 50,
            color: HexColor("#D8EAFF"),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 30,
            height: 3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //https://medium.com/ivymobility-developers/swipe-detector-in-flutter-2c8f040669bf
                GestureDetector(
                  onTapUp: (details) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TodayScreen(listSwitch: true),
                      ),
                    );
                  },
                  child: InkWell(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const TodayScreen(listSwitch: true),
                          ),
                        )),
                    child: const Text(
                      "Today",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTapUp: (details) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TodayScreen(listSwitch: true),
                      ),
                    );
                  },
                  child: InkWell(
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const TodayScreen(listSwitch: false),
                          ),
                        )),
                    child: const Text(
                      "This Week",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          BottomNavigationBar(
            currentIndex: pageIndex,
            onTap: (index) {
              // pageIndex = index;
              // if (index == 0) {
              //   scaffoldKey.currentState?.openDrawer();
              // }
              func(index);
            },
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: Colors.white,
            fixedColor: Colors.white,
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
            ),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            items: const [
              // BottomNavigationBarItem(
              //     icon: SvgPicture.asset(
              //       'assets/icons/menu.svg',
              //       color: Colors.white,
              //       height: 18,
              //     ),
              //     label: "Drawer",
              //     backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget createSimpleBottomNavigationBar(BuildContext context, stateRefresh) {
  int pageIndex = 1;
  const List<Widget> pages = [
    HomeFragment(),
    HomeFragment(),
    FavouriteFragment(),
  ];

  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    decoration: BoxDecoration(
      color: HexColor("#73B3FF"),
    ),
    child: BottomNavigationBar(
      currentIndex: 1,
      onTap: (index) {
        pageIndex = index;
      },
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(color: Colors.white),
      selectedIconTheme: IconThemeData(color: Colors.white),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
            color: Colors.white,
          ),
          label: "Business",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
      ],
    ),
  );
}

Widget _panel(ScrollController sc, context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: ListView(
      controller: sc,
      children: const <Widget>[
        TodayScreen(
          listSwitch: true,
        ),
      ],
    ),
  );
}
