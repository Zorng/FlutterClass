import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom buttons"), centerTitle: false),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomButton(text: "Submit", icon: Icons.check),
              CustomButton.secondary(
                text: "Time",
                icon: Icons.lock_clock,
                iconPosition: IconPosition.right,
              ),
              CustomButton.disabled(
                text: "Account",
                icon: Icons.person,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum Type {
  primary(
    Colors.blue,
    Color.fromARGB(255, 255, 255, 255)),
  secondary(
    Colors.green,
    Color.fromARGB(255, 0, 0, 0)),
  disabled(
    Color.fromARGB(255, 220, 220, 220),
    Color.fromARGB(255, 157, 157, 157),
  );

  final Color buttonColor;
  final Color contentColor;

  const Type(
    this.buttonColor,
    this.contentColor
  );
}

enum IconPosition {
  left(TextDirection.ltr),
  right(TextDirection.rtl);

  final TextDirection direction;
  const IconPosition(this.direction);
}

class CustomButton extends StatelessWidget {
  final String text;
  // It seems using IconData is more convenience than Icon, this allow furthur cusomtization at the Build function
  // Further study also found out that it's have better perfomance compared to Icon by not having overhead
  final IconData icon;
  final Type type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    this.type = Type.primary,
    this.iconPosition = IconPosition.left,
  });

  const CustomButton.primary({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
  }) : type = Type.primary;

  const CustomButton.secondary({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
  }) : type = Type.secondary;

  const CustomButton.disabled({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
  }) : type = Type.disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: type.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(90)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          textDirection: iconPosition.direction,
          children: [
            Icon(icon, color: type.contentColor),
            Text(text, style: TextStyle(color: type.contentColor)),
          ],
        ),
      ),
    );
  }
}
