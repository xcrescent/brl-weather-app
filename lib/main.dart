// https://youtu.be/ZSVnIphlGKI

import 'package:flutter/material.dart';
import 'package:weather_app/screens/additional/settings.dart';
import 'package:weather_app/screens/city_weather.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/screens/today_screen.dart';
import 'package:weather_app/screens/weather_now.dart';
import 'package:weather_app/screens/week_screen.dart';
import 'package:weather_app/widgets/share_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      
      theme: ThemeData(
        
        scaffoldBackgroundColor: Colors.white.withOpacity(0.95)
      ),
      routes: {
        "/": (context) => const SplashScreen(),
        "/loading": (context) => const LoadingScreen(),
        "/weather" :(context) => const WeatherHome(),
        "/settings": (context) => const SettingsScreen(),
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sky Sense"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               ",",
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/loading');
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
