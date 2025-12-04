import 'package:flutter/material.dart';
import 'package:project2/w9/quiz_app/ui/widget/naviagtion_button.dart';

class StartScreen extends StatelessWidget {
  final void Function(int) switchScreen;
  const StartScreen({super.key, required this.switchScreen});


  void handleStartPress() {
    switchScreen(1);
  }

  void handleBackPress() {
    switchScreen(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 108, 134),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(flex :1,child: const Text("My Quiz", style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),)),
              NaviagtionButton(onPressed: handleStartPress, title: "Start"),
              const SizedBox(height: 50,)
              //ElevatedButton(onPressed: handleBackPress, child: Text("Back"))
            ],
          ),
        ),
      ),
    );
  }
}