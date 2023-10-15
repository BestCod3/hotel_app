import 'package:flutter/material.dart';

import '../widgets/Button.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key, required this.onTap, required this.text})
      : super(key: key);
  void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        child: Button(
          onTap: onTap,
          text: text,
        ),
      ),
    );
  }
}
