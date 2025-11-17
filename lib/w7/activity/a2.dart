import 'package:flutter/material.dart';

void main() {

  int colorValue = 0;
  Color randomColor = Color(colorValue);

  void onPress(){
    print("hello");
    
  }
  runApp(
    MaterialApp(
      title: 'My app',
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => onPress(),
            child: const Text(
              "Press me",
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(width: 100, height: 100, color: randomColor,)
        ],
      ),
    ),
  );
}