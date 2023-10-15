import 'package:flutter/material.dart';

class Text_information_on_page extends StatelessWidget {
  const Text_information_on_page({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
  });
  final String text;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.w400, color: color),
    );
  }
}
