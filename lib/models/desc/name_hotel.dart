import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/modules/homeView/homeController.dart';

class name_hotel extends StatelessWidget {
  name_hotel({
    super.key,
  });
  HomeViewController _homeController = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-12.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Steigenberger Makadi",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            _homeController.adress.value,
            style: TextStyle(
                color: Color(0xff0D72FF),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
