import 'package:flutter/material.dart';

void main() {
  const double myWidth = 200;
  const double myHeight = 200;

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HELLO")),
        body: Center(
          child: Column(
            children: [
                Container(
                width: myWidth,
                height: myHeight,
                color: const Color.fromARGB(255, 252, 191, 6),
                //color: const Colors.amber
                child:  const Center(
                  child:  Text(
                    'HI',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 52, 7, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}