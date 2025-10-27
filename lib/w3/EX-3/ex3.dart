import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
       home: Container(
        color: const Color(0xFFE0E0E0),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),

        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Center(
                child: Text("OOP",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none
                  )
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Center(
                child: Text("DART",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none
                  )
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue.shade300,Colors.blue.shade700 ,const Color.fromARGB(255, 66, 41, 110)]),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Center(
                child: Text("FLUTTER",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none
                  )
                )
              )
            )
          ],
        )
       )
    )
  );
}