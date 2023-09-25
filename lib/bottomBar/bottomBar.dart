import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    "К выбору номера",
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
        ),
      ),
    );
  }
}
