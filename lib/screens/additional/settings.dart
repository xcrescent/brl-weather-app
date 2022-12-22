import 'package:flutter/material.dart';

enum SingingCharacter { celsius, fahrenheit }

SingingCharacter? tempUnit = SingingCharacter.celsius;

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});
  // dynamic refresh;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: const Color(0xff453D99),
                      title: const Text(
                        "Temperature Unit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 140,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RadioListTile<SingingCharacter>(
                                    value: SingingCharacter.celsius,
                                    groupValue: tempUnit,
                                    activeColor: Colors.white,
                                    
                                    // tileColor: Colors.white,
                                    title: Text(
                                      'Celsius (°C)',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (SingingCharacter? value) {
                                      Navigator.of(context).pop();
                                      // widget.refresh();
                                      setState(() {
                                        tempUnit = value;
                                      });
                                    }),
                                RadioListTile<SingingCharacter>(
                                    value: SingingCharacter.fahrenheit,
                                    activeColor: Colors.white,

                                    // tileColor: Colors.white,
                                    groupValue: tempUnit,
                                    title: Text(
                                      'Fahrenheit (°F)',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onChanged: (SingingCharacter? value) {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        tempUnit = value;
                                      });
                                    }),
                              ],
                            ),
                          ),
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
