import 'package:flutter/material.dart';

class Item_category extends StatelessWidget {
  const Item_category({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-125.0, 25.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }
}
