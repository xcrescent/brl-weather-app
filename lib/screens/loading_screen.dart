import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/screens/weather_now.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  void timerNext() {
    Timer(const Duration(milliseconds: 3600), () {
      if (globalController.checkLoading().isFalse) {
        Navigator.pushReplacementNamed(context, '/weather');
      } else if (globalController.checkLoading().isFalse){
        timerNext();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 3600), () {
      if (globalController.checkLoading().isFalse) {
        Navigator.pushReplacement(
          context,
          //page route after splash screen
          MaterialPageRoute(builder: (context) => const WeatherHome()),
        );
      }
      setState(() {
        timerNext();
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Obx(
            () => globalController.checkLoading().isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Waiting....',
                          textStyle: TextStyle(
                            fontSize: ((MediaQuery.of(context).size.height /
                                    (MediaQuery.of(context).size.width)) *
                                20),
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 400)),
                    ],
                    totalRepeatCount: 1,
                  ),
          ),
        ),
      ),
    );
  }
}
