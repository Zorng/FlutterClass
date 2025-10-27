import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String s;
  const MyWidget({
    super.key,
    required this.myWidth,
    required this.myHeight,
    required this.s
  });

  final double myWidth;
  final double myHeight;

  @override
  Widget build(BuildContext context) {
    
    return Container(
    margin:EdgeInsets.only(top: 30) ,
    padding: EdgeInsets.all(40),
    width: myWidth,
    height: myHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      gradient: LinearGradient(colors: [const Color.fromARGB(255, 7, 78, 212) , Color.fromARGB(255, 58, 23, 186)])
    ),
    //color: const Colors.amber
    child: Center(
      child:  Text(
        'HI $s',
        style: TextStyle(
          fontSize: 35,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
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
        appBar: AppBar(title: const Text("HELLO")),
        body: Center(
          child: Column(
            children: [
              MyWidget(myWidth: 300, myHeight: 180, s: "1"),
              MyWidget(myWidth: 300, myHeight: 180, s: "2"),
              MyWidget(myWidth: 300, myHeight: 180, s: "3"),
            ]
          ),
        ),
      ),
    ),
  );
}