import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  int size;
  final String text;
  final Color color;
  AppLargeText(
      {Key? key,
      this.size = 30,
      required this.text,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.toDouble(),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
