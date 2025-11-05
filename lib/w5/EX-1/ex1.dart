import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: false, title: Text("My Hobbies")),
        body: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(color: Colors.grey),
          child: Center(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  HobbyCard(
                    title: "Travelling",
                    icon: Icon(Icons.travel_explore, color: Colors.white),
                    color: Color.fromARGB(255, 102, 187, 106),
                  ),
                  HobbyCard(
                    title: "Skating",
                    icon: Icon(Icons.skateboarding, color: Colors.white),
                    color: Color.fromARGB(255, 83, 115, 160),
                  ),
                  HobbyCard(
                    title: "Coding",
                    icon: Icon(Icons.code, color: Colors.white),
                    color: Color.fromARGB(255, 106, 144, 11),
                  ),
                  HobbyCard(
                    title: "Music",
                    icon: Icon(Icons.music_note, color: Colors.white),
                    color: Color.fromARGB(255, 111, 11, 63),
                  ),
                  HobbyCard(
                    title: "Manger Croissant au Chocolat",
                    icon: Icon(Icons.bakery_dining, color: Color.fromARGB(255, 248, 198, 50)),
                    color: Color.fromARGB(255, 83, 48, 34),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
  );
}

class HobbyCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final Color color;
  const HobbyCard({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      child: Center(
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.all(30), child: icon),
            Text(title, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
