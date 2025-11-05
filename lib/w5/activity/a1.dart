import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Container(height: 400, color: Colors.blue),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(child: Container(color: Colors.green)),
                      Container(width: 100, color: Colors.pinkAccent),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 100,
                          color: const Color.fromARGB(255, 226, 186, 6),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          width: 100,
                          color: const Color.fromARGB(255, 226, 186, 6),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          width: 100,
                          color: const Color.fromARGB(255, 226, 186, 6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(child: Container(color: Colors.pinkAccent)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
