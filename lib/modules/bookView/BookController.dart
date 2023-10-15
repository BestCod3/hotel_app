import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

class BookController extends GetxController {
  Rx<String> departure = ''.obs;
  Rx<String> arrival_country = ''.obs;
  Rx<String> tour_date_start = ''.obs;
  Rx<String> tour_date_stop = ''.obs;
  Rx<int> number_of_nights = 0.obs;
  Rx<String> room = ''.obs;
  Rx<String> nutrition = ''.obs;
  Rx<int> tour_price = 0.obs;
  Rx<int> service_charge = 0.obs;
  Rx<int> fuel_charge = 0.obs;
  Rx<int> price = 0.obs;

  @override
  void onInit() {
    showWeatherByLocation();

    super.onInit();
  }

  Future<void> showWeatherByLocation() async {
    await getData();
  }

  Future<void> getData() async {
    try {
      final client = http.Client();
      final url =
          'https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8';
      Uri uri = Uri.parse(url);
      final result = await client.get(uri);
      final jsonResult = jsonDecode(result.body);
      departure.value = jsonResult['departure'];
      arrival_country.value = jsonResult['arrival_country'];
      tour_date_start.value = jsonResult['tour_date_start'];
      tour_date_stop.value = jsonResult['tour_date_stop'];
      number_of_nights.value = jsonResult['number_of_nights'];
      room.value = jsonResult['room'];
      nutrition.value = jsonResult['nutrition'];
      tour_price.value = jsonResult['tour_price'];
      service_charge.value = jsonResult['service_charge'];
      fuel_charge.value = jsonResult['fuel_charge'];

      log('response ===> ${jsonResult['departure']}');
    } catch (e) {
      log('$e');
      throw Exception(e);
    }
  }
}
