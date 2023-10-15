import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/modules/bookView/bookView.dart';
import 'package:hotel_app/modules/homeView/homeView.dart';

void main() {
  runApp(HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
