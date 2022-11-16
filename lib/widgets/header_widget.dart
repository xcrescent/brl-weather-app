import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  // String date = DateTime.now().toString();
  

  // getAddress(latitude, longitude) async {
  //   // List<Placemark> placemark =
  //   //     await placemarkFromCoordinates(latitude, longitude);
  //   // Placemark place = placemark[0];
  //   setState(() {
  //     // city = place.locality!;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // city = getAddress(,
    //     globalController.getLongitude().value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: const TextStyle(fontSize: 35),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: const Text( "",
            style:  TextStyle(fontSize: 35, color: Colors.grey),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: const Text(
            "date",
            style: TextStyle(fontSize: 35, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
