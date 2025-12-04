import 'package:flutter/material.dart';

class NaviagtionButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final bool primary;
  const NaviagtionButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.primary = true
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:WidgetStatePropertyAll(primary? Colors.deepOrangeAccent: Colors.blueGrey)
      ),
      child: Text(title),
    );
  }
}
