import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/modules/chooseView/chooseView.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  CustomAppBar({super.key, required this.height, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // leading: IconButton(
      //     onPressed: () {
      //       // Get.back(()=>ChooseView(),);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios_new,
      //       color: Colors.black,
      //     )),
      title: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
