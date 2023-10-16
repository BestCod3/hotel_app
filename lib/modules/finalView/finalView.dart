import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/appBar/appBar.dart';
import 'package:hotel_app/models/desc/description_list.dart';
import 'package:hotel_app/models/desc/text_information.dart';
import 'package:hotel_app/modules/bookView/bookView.dart';

class FinalView extends StatelessWidget {
  const FinalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          height: 60,
          text: "Заказ оплачен",
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Image.asset("assets/images/Frame 610.png"),
              ),
              Text(
                "Ваш заказ принят в работу",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text_information_on_page(
                    text:
                        "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
                    color: Colors.grey,
                    fontSize: 16),
              )
            ],
          ),
        ));
  }
}
