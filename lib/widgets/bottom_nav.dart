import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipe/swipe.dart';
import 'package:weather_app/screens/fragments/favourite_fragment.dart';
import 'package:weather_app/utils/hexcolor.dart';

import '../screens/fragments/home_fragment.dart';

Widget createBottomNavigationBar(pageIndex, BuildContext context, func) {
  // ScrollController scrollController = ScrollController();
  return Swipe(
    // key: const Key("dis"),
    // controller: scrollController,
    // : ((direction) {
    // if (direction == DismissDirection.up) {
    // Navigator.pushNamed(context, '/today');
    // }
    // }),
    onSwipeUp: () {
      Navigator.pushNamed(context, '/today');
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
        mainAxisAlignment: MainAxisAlignment.center,
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
                InkWell(
                  onTap: (() => Navigator.pushNamed(context, '/today')),
                  child: Text(
                    "Today",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (() => Navigator.pushNamed(context, '/this_week')),
                  child: Text(
                    "This Week",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BottomNavigationBar(
            currentIndex: pageIndex,
            onTap: (index) {
              // pageIndex = index;
              func(index);
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
                label: "Drawer",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/favourite.svg',
                  color: Colors.white,
                ),
                label: "Favourite",
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
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/favourite.svg',
            color: Colors.white,
          ),
          label: "School",
        ),
      ],
    ),
  );
}
