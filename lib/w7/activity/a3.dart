import 'package:flutter/material.dart';
import 'dart:math';

const String diceImage1 = 'assets/dices/dice-1.png';
const String diceImage2 = 'assets/dices/dice-2.png';
const String diceImage3 = 'assets/dices/dice-3.png';
const String diceImage4 = 'assets/dices/dice-4.png';
const String diceImage5 = 'assets/dices/dice-5.png';
const String diceImage6 = 'assets/dices/dice-6.png';

String activeDiceImage = diceImage2;

class MyDice extends StatefulWidget {
  const MyDice({super.key});

  @override
  State<StatefulWidget> createState() => _MyDiceState();
}

class _MyDiceState extends State<MyDice> {
  String activeDiceImage = diceImage2;

  void rollDice() {
    Random random = Random();
    int r = random.nextInt(6) + 1;
    setState(() {
      switch (r) {
        case 1:
          activeDiceImage = diceImage1;
          break;
        case 2:
          activeDiceImage = diceImage2;
          break;
        case 3:
          activeDiceImage = diceImage3;
          break;
        case 4:
          activeDiceImage = diceImage4;
          break;
        case 5:
          activeDiceImage = diceImage5;
          break;
        case 6:
          activeDiceImage = diceImage6;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(onTap: rollDice ,child: Image.asset(activeDiceImage, width: 200)),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: MyDice()),
    ),
  ),
);

class Mycard extends StatefulWidget {
  const Mycard({super.key});

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
