import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Color color1;
  final Color color2;
  const GradientButton({
    super.key,
    required this.text,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: List.empty(growable: true)
      ),
      child: Center(
        child: Text(
          "Click",
          style: TextStyle(fontSize: 20, color: Color(0xffffffff)),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      scrollBehavior: ScrollBehavior(),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradientButton(
                text: "click me",
                color1: Colors.orange.shade600,
                color2: Colors.cyan.shade400,
              ),
              GradientButton(
                text: "click me",
                color1: Colors.pink.shade600,
                color2: Colors.green.shade800,
              ),
              GradientButton(
                text: "click me",
                color1: Colors.red.shade600,
                color2: Colors.blue.shade800,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
