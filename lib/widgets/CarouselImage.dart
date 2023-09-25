import 'package:flutter/material.dart';

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
