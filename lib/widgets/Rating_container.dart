import 'package:flutter/material.dart';

import '../modules/homeView/homeController.dart';

class Rating_container extends StatelessWidget {
  const Rating_container({
    super.key,
    required HomeViewController homeController,
  }) : _homeController = homeController;

  final HomeViewController _homeController;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-97.0, 0.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 149,
          height: 29,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 251, 230, 167)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.star,
                size: 15,
                color: Color(0xffFFA800),
              ),
              Text(
                "${_homeController.rating.value}  ${_homeController.rating_name.value}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFFA800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
