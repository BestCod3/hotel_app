import 'package:flutter/material.dart';

class room_button extends StatelessWidget {
  const room_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 192,
        height: 29,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromRGBO(13, 114, 255, 0.1)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Подробнее о номере',
                style: TextStyle(
                    color: Color(0xff0D72FF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.navigate_next_outlined,
                color: Color(0xff0D72FF),
                size: 26,
              )
            ],
          ),
        ),
      ),
    );
  }
}
