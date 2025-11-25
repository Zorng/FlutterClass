import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

List<Widget> getLabel() {return colors.map((c) => Label(c)).toList();} 


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              //addvantage readability
              Label("Method 1: Loop in Array", bold: true),
              for(int i = 0; i < colors.length; i++) Label(colors[i]),
              
              //advantage performance
              Label("Method 2: Map", bold: true),
              ... colors.map((c) => Label(c)),
            
              // advantage separation of concern
              Label("Method 23: Dedicated Function", bold: true),
              ... getLabel(),
              
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

