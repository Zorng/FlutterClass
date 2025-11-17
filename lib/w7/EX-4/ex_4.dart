import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(spacing: 15, 
                children: [
                  ScoreCard(title: "Nastiness"),
                  ScoreCard(title: "My Score in Flutter", initialScore: 10, scoreBarWidth: 230,),
                  ScoreCard(title: "My Score in Dart", initialScore: 9, scoreBarWidth: 310,),
                  ScoreCard(title: "Stress Level", initialScore: 8, scoreBarWidth: 280,),
              ]),
            ],
          ),
        ),
      ),
    ),
  ),
);

class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;
  final double scoreBarWidth;
  const ScoreCard({
    super.key,
    required this.title,
    this.initialScore = 1,
    this.scoreBarWidth = 300,
  }) : assert(
         initialScore >= 1 && initialScore <= 10,
         "Initial must be within 1 and 10 exclusively",
       );

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  void add() {
    if (score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void subtract() {
    if (score > 1) {
      setState(() {
        score--;
      });
    }
  }

  // This syntax is crazy. a getter + lamda function + switch case + usage of pattern inside each case
  Color get scoreColor => switch (score) {
    >= 1 && <= 4 => const Color.fromARGB(255, 255, 40, 36),
    >= 5 && <= 7 => const Color.fromARGB(255, 255, 200, 36),
    >= 8 && <= 9 => const Color.fromARGB(255, 69, 255, 36),
    10 => const Color.fromARGB(255, 36, 116, 255),
    _ =>
      Colors
          .black, // dart required cases to be exhuastive, this wild card will never be touched by design
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          widget.scoreBarWidth +
          16, // 16 here is th padding, so now the score bar in stack should have length of scoreBarWidth
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: subtract, icon: Icon(Icons.remove)),
              const SizedBox(width: 40),
              IconButton(onPressed: add, icon: Icon(Icons.add)),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),

                    border: Border.all(),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: widget.scoreBarWidth / 10 * score,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      color: scoreColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          score == 10 ? Text("AMAZON!") : const SizedBox(height: 20),
        ],
      ),
    );
  }
}
