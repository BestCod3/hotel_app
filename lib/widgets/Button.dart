import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.onTap, required this.text});
  final String text;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: 50,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffb0D72FF),
            )),
      ),
    );
  }
}
