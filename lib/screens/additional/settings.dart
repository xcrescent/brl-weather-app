import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (() {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Temperature Unit"),
                      content: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                'Please turn on your internet connection'),
                            const Text(
                                'Please turn on your internet connection'),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 37.0, vertical: 8.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Temperature Unit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Celsius °C",
                          style: TextStyle(
                            color: Color(0xff656565),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]),
                ),
              ),
              Divider(),
              InkWell(
                onTap: (() {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Build 1.0.0.0")));
                }),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 37.0, vertical: 8.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Build Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "1.0.0.0",
                          style: TextStyle(
                            color: Color(0xff656565),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]),
                ),
              ),
              Divider(),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, "/user_agree");
                }),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 37.0, vertical: 8.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "User Agreement",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(context, "/privacy");
                }),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 37.0, vertical: 8.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Privacy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
