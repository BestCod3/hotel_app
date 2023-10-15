import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/appBar/appBar.dart';
import 'package:hotel_app/bottomBar/bottomBar.dart';
import 'package:hotel_app/models/desc/item_category.dart';
import 'package:hotel_app/models/desc/name_hotel.dart';
import 'package:hotel_app/modules/bookView/BookController.dart';
import 'package:hotel_app/modules/bookView/addAnimated.dart';
import 'package:hotel_app/modules/finalView/finalView.dart';
import 'package:hotel_app/modules/homeView/homeController.dart';

import 'package:hotel_app/widgets/Rating_container.dart';

import '../../models/desc/text_information.dart';
import '../../widgets/form_field_on_book.dart';
import 'AnimatedContainer.dart';
import 'list_information.dart';

class BookView extends StatelessWidget {
  BookView({Key? key}) : super(key: key);

  final HomeViewController _homeController = Get.put(HomeViewController());

  final BookController _bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      appBar: CustomAppBar(height: 60, text: "Бронирование"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Rating_container(homeController: _homeController),
                    name_hotel(text: "Steigenberg Makadi")
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 0.30,
                // width: 375,
                // height: 530,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    List_information_to(
                        text: "Вылет из",
                        import: _bookController.departure.value),
                    List_information_to(
                        text: "Страна, город",
                        import: _bookController.arrival_country.value),
                    List_information_to(
                        text: "Даты",
                        import:
                            "${_bookController.tour_date_start.value}-${_bookController.tour_date_stop.value}"),
                    List_information_to(
                        text: "Кол-во ночей",
                        import:
                            "${_bookController.number_of_nights.value} ночей"),
                    List_information_to(
                        text: "Отель", import: "Staigenberg Makadi"),
                    List_information_to(
                        text: "Номер", import: _bookController.room.value),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Transform.translate(
                      offset: const Offset(-35, 0.0),
                      child: const Text(
                        "Информация о покупателе",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const form_field(
                      text: "Номер телефона",
                    ),
                    const form_field(text: "Почта"),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text_information_on_page(
                        text:
                            "Эти данные никому не передаются. После оплаты мы вышлим чек на указанный вами номер и почту",
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: AnimatedDrawer(
                    text: "Первый турист",
                    sizedBox: 75,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: AnimatedDrawer(
                    text: "Второй турист",
                    sizedBox: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const AddAnimatedDrawer(
                    sizedBox: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    List_information_to(
                        text: "Тур",
                        import: "${_bookController.tour_price.value} ₽"),
                    List_information_to(
                        text: "Топливный сбор",
                        import: "${_bookController.fuel_charge.value} ₽"),
                    List_information_to(
                        text: "Сервисный сбор",
                        import: "${_bookController.service_charge.value} ₽"),
                    List_information_to(
                        text: "Общий сбор",
                        import:
                            "${_bookController.tour_price.value + _bookController.fuel_charge.value + _bookController.service_charge.value} ₽")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        onTap: () {
          Get.to(FinalView());
        },
        text:
            "Оплатить ${_bookController.tour_price.value + _bookController.fuel_charge.value + _bookController.service_charge.value} ₽",
      ),
    );
  }
}
