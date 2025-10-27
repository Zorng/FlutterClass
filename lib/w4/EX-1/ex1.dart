import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My app',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 165, 87, 121),
        body: const Center(
          child: Text('Hello my name is Ronan!',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 50
            ),
          ),
        )
      ),
    ),
  );
}
