import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/screens/weather_now.dart';
import 'package:weather_app/utils/hexcolor.dart';

import '../screens/fragments/home_fragment.dart';

Widget createBottomNavigationBar(pageIndex,BuildContext context, func) {
  
  return Container(
    height: 105,
    decoration: BoxDecoration(
      // gradient: LinearGradient(
      //   colors: [HexColor("#D8EAFF"), HexColor("#82BAFB")],
      //   begin: Alignment.topLeft,
      //   end: Alignment.topRight,
      //   // stops: [0.0, 0.8],
      //   tileMode: TileMode.repeated,
      // ),
      color: HexColor("#73B3FF"),
      border: Border(),
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
        Container(
          width: 30,
          height: 3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
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
                child: Text("Today"),
              ),
              InkWell(
                onTap: (() => Navigator.pushNamed(context, '/this_week')),
                child: Text("This week"),
              ),
            ],
          ),
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
  );
}

Widget createSimpleBottomNavigationBar(BuildContext context) {
  int pageIndex = 0;
  const List<Widget> pages = [
    HomeFragment(),
    HomeFragment(),
    HomeFragment(),
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
