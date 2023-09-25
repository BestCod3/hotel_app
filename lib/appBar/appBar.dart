import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  CustomAppBar({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Center(
        child: const Text(
          "Отель",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
