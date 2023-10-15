import 'package:flutter/material.dart';

import 'BookController.dart';

class List_information_to extends StatelessWidget {
  List_information_to({super.key, required this.text, required this.import});
  final String import;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            text,
            style: TextStyle(
              color: Color.fromRGBO(130, 135, 150, 1),
              fontSize: 16,
            ),
          ),
        ),
        Text(
          import,
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ],
    );
  }
}
