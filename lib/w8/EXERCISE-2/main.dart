import 'package:flutter/material.dart';
import 'package:project2/w8/EXERCISE-2/ui/screens/temperature_screen.dart';

import 'ui/screens/welcome_screen.dart';
 
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}


class _TemperatureAppState extends State<TemperatureApp> {
  late Widget page;
 
  @override
  void initState() {
    page = WelcomeScreen(onPressed: handleStartClick,);
    super.initState();
  }

  void handleStartClick() {
    setState(() {
      page = DynamicTemperatureScreen(navigate: handleBackClick,);
    });
  }

  void handleBackClick() {
    setState(() {
      page = WelcomeScreen(onPressed: handleStartClick,);
    });
  }

  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: page
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
