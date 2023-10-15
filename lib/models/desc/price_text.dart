import 'package:flutter/material.dart';

import '../../modules/homeView/homeController.dart';

class Price_text extends StatelessWidget {
  const Price_text({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-10.0, 0.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const TextSpan(text: '  '),
            TextSpan(
              text: text2,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff828796),
              ),
            )
          ],
        ),
      ),
    );
  }
}
