import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/appBar/appBar.dart';
import 'package:hotel_app/models/desc/description_list.dart';
import 'package:hotel_app/models/desc/name_hotel.dart';
import 'package:hotel_app/models/desc/price_text.dart';
import 'package:hotel_app/modules/bookView/bookView.dart';
import 'package:hotel_app/modules/chooseView/chooseController.dart';
import 'package:hotel_app/modules/chooseView/chooseController2.dart';
import 'package:hotel_app/widgets/Button.dart';

import '../../widgets/CarouselImage.dart';
import '../../widgets/roomButton.dart';

class ChooseView extends StatefulWidget {
  ChooseView({Key? key}) : super(key: key);

  @override
  _ChooseViewState createState() => _ChooseViewState();
}

class _ChooseViewState extends State<ChooseView> {
  late ChooseController _chooseController;
  late ChooseController2 _chooseController2;

  @override
  void initState() {
    super.initState();
    _chooseController = Get.put(ChooseController());
    _chooseController.showWeatherByLocation();
    _chooseController2 = Get.put(ChooseController2());
    _chooseController2.showWeatherByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      appBar: CustomAppBar(height: 60, text: 'Steigenberger Makadi'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      items: const [
                        CarouselContainer(
                          url:
                              'https://www.atorus.ru/sites/default/files/upload/image/News/56871/%D1%80%D0%B8%D0%BA%D1%81%D0%BE%D1%81%20%D1%81%D0%B8%D0%B3%D0%B5%D0%B9%D1%82.jpg',
                        ),
                        CarouselContainer(
                          url:
                              'https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o=',
                        ),
                        CarouselContainer(
                          url:
                              'https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg',
                        )
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
                      offset: Offset(33.0, 0.0),
                      child: Text(
                        _chooseController.name.value,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    container_description_list(
                        text: _chooseController.peculiarities.join(',  ')),
                    room_button(),
                    Price_text(
                        text1: '${_chooseController.price.value} ₽',
                        text2: _chooseController.price_per.value),
                    Button(onTap: () {}, text: "Выбрать номер")
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      items: const [
                        CarouselContainer(
                          url:
                              'https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600',
                        ),
                        CarouselContainer(
                          url:
                              'https://www.google.com/search?q=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&tbm=isch&ved=2ahUKEwilufKp-4KBAxUfJxAIHR4uAToQ2-cCegQIABAA&oq=%D0%BD%D0%BE%D0%BC%D0%B5%D1%80+%D0%BB%D1%8E%D0%BA%D1%81+%D0%B2+%D0%BE%D1%82%D0%B5%D0%BB%D0%B8+%D0%B5%D0%B3%D0%B8%D0%BF%D1%82%D0%B0+%D1%81+%D1%81%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0%D1%81%D1%81%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&gs_lcp=CgNpbWcQAzoECCMQJ1CqAVi6HGDmHWgAcAB4AIABXIgB3wySAQIyNZgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=Y3fuZOX7KJ_OwPAPntyE0AM&bih=815&biw=1440#imgrc=Nr2wzh3vuY4jEM&imgdii=zTCXWbFgrQ5HBM',
                        ),
                        CarouselContainer(
                          url:
                              'https://tour-find.ru/thumb/2/bsb2EIEFA8nm22MvHqMLlw/r/d/screenshot_3_94.png',
                        )
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
                      offset: Offset(-20.0, 0.0),
                      child: Text(
                        _chooseController2.name.value,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    container_description_list(
                        text: _chooseController2.peculiarities.join(',  ')),
                    room_button(),
                    Price_text(
                        text1: '${_chooseController2.price.value} ₽',
                        text2: _chooseController2.price_per.value),
                    Button(
                        onTap: () {
                          Get.to(BookView());
                        },
                        text: "Выбрать номер")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
