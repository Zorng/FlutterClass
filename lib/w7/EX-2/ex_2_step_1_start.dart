import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [
            TheBestCard(isFavorite: true),
            TheBestCard(isFavorite: false, title: "Rotten egg", description: "Uhh ohh, no thanks",),
            TheBestCard(isFavorite: true, title: "Ronan Flutter Class", description: "The best",),
            TheBestCard(isFavorite: true, title: "Hot latte 50% Sugar", description: "Balancing sweetness and bitterness. Taste the best when warm",),
          ],
        ),
    ),
  ),
);

class TheBestCard extends StatefulWidget {
  final bool isFavorite;
  final String title;
  final String description;
  const TheBestCard({super.key, required this.isFavorite, this.title = "title", this.description = "description"});

  @override
  State<TheBestCard> createState() => _TheBestCardState();
}

class _TheBestCardState extends State<TheBestCard> {
  bool ? _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  void iconPressed() {
    setState(() {
      _isFavorite = !_isFavorite!;
    });
  }

  Icon get icon => _isFavorite! ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border, color: Colors.grey.shade500,);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(onPressed: iconPressed, icon: icon),
        ],
      ),
    );
  }
}
