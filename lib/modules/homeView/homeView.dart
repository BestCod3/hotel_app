import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:hotel_app/bottomBar/bottomBar.dart';
import 'package:hotel_app/modules/chooseView/chooseView.dart';
import 'package:hotel_app/modules/homeView/homeController.dart';
import 'package:hotel_app/widgets/CarouselImage.dart';
import 'package:http/http.dart' as http;

import '../../models/desc/description_list.dart';
import '../../models/desc/item_category.dart';
import '../../models/desc/list_items_infor.dart';
import '../../models/desc/name_hotel.dart';
import '../../models/desc/price_text.dart';
import '../../widgets/Rating_container.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  HomeViewController _homeController = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            "Отель",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 2,
                height: MediaQuery.sizeOf(context).height * 0.6,
                // width: 375,
                // height: 530,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      items: const [
                        CarouselContainer(
                          url:
                              'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg',
                        ),
                        CarouselContainer(
                            url:
                                "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg"),
                        CarouselContainer(
                            url:
                                "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg")
                      ],
                      options: CarouselOptions(
                        height: 257.0,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                      ),
                    ),
                    Rating_container(homeController: _homeController),
                    name_hotel(
                      text: "Steigenberger Makadi",
                    ),
                    Price_text(
                      text1: 'от ${_homeController.minimal_price.value} ₽',
                      text2: _homeController.priceforit.value,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1,
                height: MediaQuery.sizeOf(context).height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Item_category(
                      text: 'Об отеле',
                    ),
                    container_description_list(
                      text: _homeController.peculiarities
                          .join(', '), // Преобразование в строку
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        _homeController.description.value,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                      child: List_items_infor(
                          listItems: _homeController.listItems,
                          listIcon: _homeController.listIcon),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        text: "К выбору номера",
        onTap: () {
          Get.to(ChooseView());
        },
      ),
    );
  }
}
