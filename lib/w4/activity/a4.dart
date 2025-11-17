import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[300],
      child: Column(
        children: [
          NewWidget(text: "Dart", color: Colors.blueAccent),
          NewWidget(text: "OOP", color: const Color.fromARGB(255, 223, 173, 8)),
          NewWidget(text: "Flutter", color: const Color.fromARGB(255, 28, 197, 141)),
        ],
      ),
    ),
  ));
}

class NewWidget extends StatelessWidget {
  final String data;
  final Color paintColor;
  
  const NewWidget({
    super.key,
    required String text,
    Color color = Colors.blue
  }):paintColor = color, data = text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
          color: paintColor,
          borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
        data,
        style: TextStyle(
            color: Colors.white, decoration: TextDecoration.none),
      )),
    );
  }
}

