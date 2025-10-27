import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String data;
  final Color paintColor;
  final List<Color> gradientColors;

  const CustomCard({
    super.key,
    required String text,
    Color color = Colors.blue,
    List<Color> colors = const [],
  }) : data = text,
       paintColor = color,
       gradientColors = colors;

  @override
  Widget build(BuildContext context) {
    if (gradientColors.isEmpty) {
      return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: paintColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: Text(
            data,
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: Text(
            data,
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    }
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: const Color.fromARGB(255, 197, 200, 201),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),

        child: Column(
          children: [
            CustomCard(text: "OOP", colors: [Colors.blue.shade600, Colors.purple.shade700]),
            CustomCard(text: "DART", color: Colors.blue.shade300),
            CustomCard(text: "FLUTTER", color: Colors.cyan.shade600),
            CustomCard(
              text: "FLUTTER ROOKIE",
              color: Colors.deepPurple.shade600,
            ),
            CustomCard(
              text: "FLUTTER GUY",
              colors: [Colors.red.shade400, Colors.green.shade500, Colors.orange.shade600]
            ),
          ],
        ),
      ),
    ),
  );
}
