import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.low);
    // log(position.latitude.toString()+position.longitude.toString());
    setState(() {
      Navigator.of(context).pushNamed('/weather');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
