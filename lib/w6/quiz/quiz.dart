import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 50, right: 50),
              decoration: BoxDecoration(color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(color: Colors.yellow),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(color: Colors.yellow),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.green),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
