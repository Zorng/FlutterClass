import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            spacing: 15,
            children: [
              MyButton(),
              MyButton(),
              MyButton(),
              MyButton(),

            ],
          ),
        ),
      ),
    ),
  ),
);

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;
  String get buttonLable => isSelected ? "Selected" : "Not Selected";

  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  void _press() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: _press,
      child:  Center(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(buttonLable, style: TextStyle(color: textColor),),
      )),
    );
  }
}
