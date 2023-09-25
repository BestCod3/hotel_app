import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hotel_app/bottomBar/bottomBar.dart';
import 'package:hotel_app/modules/homeView/homeController.dart';
import 'package:hotel_app/widgets/CarouselImage.dart';
import 'package:http/http.dart' as http;
import '../../appBar/appBar.dart';
import '../../models/desc/description_list.dart';
import '../../models/desc/name_hotel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  HomeViewController _homeController = Get.put(HomeViewController());

  List<String> listItems = ['Удобство', 'Что включено', 'Что не включено'];

  List<String> listIcon = [
    'assets/images/emoji-happy.svg',
    'assets/images/tick-square.svg',
    'assets/images/close-square.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: CustomAppBar(
        height: 40,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1,
                height: MediaQuery.sizeOf(context).height * 0.7,
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
                    Transform.translate(
                      offset: const Offset(-97.0, 0.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 149,
                          height: 29,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 251, 230, 167)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Color(0xffFFA800),
                              ),
                              Text(
                                "${_homeController.rating.value}  ${_homeController.rating_name.value}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFA800),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    name_hotel(),
                    Transform.translate(
                      offset: Offset(-25.0, 0.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'от ${_homeController.minimal_price.value}',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const TextSpan(text: '  '),
                            TextSpan(
                              text: _homeController.priceforit.value,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff828796),
                              ),
                            )
                          ],
                        ),
                      ),
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
                    Item_category(),
                    container_description_list(
                      text: _homeController.peculiarities
                          .join(', '), // Преобразование в строку
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        _homeController.description.value,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listItems.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: SvgPicture.asset(listIcon[index]),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                            listItems[index],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: const Text(
                            'Самое необходимое',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class Item_category extends StatelessWidget {
  const Item_category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-125.0, 25.0),
      child: Text(
        "Об отеле",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }
}
