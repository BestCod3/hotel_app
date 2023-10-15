import 'package:flutter/material.dart';

class form_field extends StatelessWidget {
  const form_field({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      width: 350,
      height: 52,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          cursorColor: Colors.grey,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: text,
              labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
        ),
      ),
    );
  }
}
