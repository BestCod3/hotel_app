import 'package:flutter/material.dart';

import 'AnimatedContainer.dart';

class AddAnimatedDrawer extends StatefulWidget {
  const AddAnimatedDrawer({Key? key, required this.sizedBox}) : super(key: key);
  final double sizedBox;
  @override
  State<AddAnimatedDrawer> createState() => _AddAnimatedDrawerState();
}

class _AddAnimatedDrawerState extends State<AddAnimatedDrawer> {
  List<Widget> containers = []; // Список контейнеров

  void addContainer() {
    setState(() {
      containers.add(AnimatedDrawer(
        text: "Третий турист",
        sizedBox: 25,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Добавить туриста",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: widget.sizedBox,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              onPressed: addContainer,
            ),
          ),
        ),
      ],
    );
  }
}
