import 'package:flutter/material.dart';

class container_description_list extends StatelessWidget {
  const container_description_list({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Container(
        // width: 92,
        // height: 29,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xffFBFBFC)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff828796)),
        ),
      ),
    );
  }
}
