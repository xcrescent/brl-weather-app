import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
      Timer(const Duration(milliseconds: 5400), () {
        Navigator.pushReplacement(
          context,
          //page route after splash screen
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(69, 61, 153, 1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/sp.gif'),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     const SizedBox(width: 20.0),
              //     Text(
              //       'Sky',
              //       style: TextStyle(fontSize: ((MediaQuery.of(context).size.height /
              //         (MediaQuery.of(context).size.width))*20),),
              //     ),
              //     const SizedBox(width: 20.0, height: 100.0),
              //     DefaultTextStyle(
              //       style: const TextStyle(
              //         fontSize: 40.0,
              //         fontFamily: 'Horizon',
              //       ),
              //       child: AnimatedTextKit(
              //         animatedTexts: [
              //           TypewriterAnimatedText(
              //             'Sense',
              //             textStyle:TextStyle(
              //                 fontSize: ((MediaQuery.of(context).size.height /
              //         (MediaQuery.of(context).size.width))*20),
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             speed: const Duration(milliseconds: 400)
              //             ),
              //         ],
              //         totalRepeatCount: 1,
              //       ),
              //     ),
              //   ],
              // )
              TextLiquidFill(
                text: 'Sky Sense',
                waveColor: Colors.white,
                boxBackgroundColor: Color.fromRGBO(69, 61, 153, 1),
                textStyle: TextStyle(
                  fontSize: ((MediaQuery.of(context).size.height /
                          (MediaQuery.of(context).size.width)) *
                      20),
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
