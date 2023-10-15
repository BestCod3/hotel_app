import 'package:flutter/material.dart';

import '../../widgets/form_field_on_book.dart';

class AnimatedDrawer extends StatefulWidget {
  final String text;
  final double sizedBox;
  AnimatedDrawer({required this.text, required this.sizedBox});

  @override
  State<AnimatedDrawer> createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> {
  double _drawerHeight = 0;
  double _containerHeight = 0;

  void toggleDrawer() {
    setState(() {
      if (_drawerHeight == 0) {
        _drawerHeight = 400;
        _containerHeight = 400; // Измените высоту, чтобы открыть шторку
      } else {
        _drawerHeight = 0;
        _containerHeight = 0; // Измените высоту, чтобы закрыть шторку
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: widget.sizedBox,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(13, 114, 255, 0.1),
                      borderRadius: BorderRadius.circular(6)),
                  child: IconButton(
                    icon: Icon(
                      Icons.expand_more,
                      size: 30,
                    ),
                    onPressed: toggleDrawer,
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: _drawerHeight,
            child: Expanded(
              // Оберните контейнер в Expanded
              child: Container(
                color: Colors.white,
                height: _containerHeight, // Используйте _containerHeight
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          form_field(text: "Имя"),
                          SizedBox(
                            height: 10,
                          ),
                          form_field(text: "Фамилие"),
                          SizedBox(
                            height: 10,
                          ),
                          form_field(text: "Дата рождения"),
                          SizedBox(
                            height: 10,
                          ),
                          form_field(text: "Гражданство"),
                          SizedBox(
                            height: 10,
                          ),
                          form_field(text: "Номер загранпаспорта"),
                          SizedBox(
                            height: 10,
                          ),
                          form_field(text: "Срок действия загранпаспорта"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
