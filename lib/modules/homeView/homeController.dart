// import 'package:get/get.dart';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;

// class HomeViewController extends GetxController {
//   Rx<String> priceforit = ''.obs;

//   Rx<String> adress = ''.obs;
//   Rx<int> minimal_price = 0.obs;
//   Rx<int> rating = 0.obs;
//   Rx<String> rating_name = ''.obs;
//   Rx<String> description = ''.obs;
//   Rx<List<dynamic>> peculiarities = <dynamic>[].obs;

//   @override
//   void onInit() async {
//     super.onInit();
//     await showWeatherByLocation();
//   }

//   Future<void> showWeatherByLocation() async {
//     await getData();
//   }

//   Future<void> getData() async {
//     try {
//       final client = http.Client();
//       final url =
//           'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3';
//       Uri uri = Uri.parse(url);
//       final result = await client.get(uri);
//       // utf8.decode(result.bodyBytes);
//       // final jsonResult = jsonDecode(utf8.decode(result.bodyBytes));
//       final jsonResult = jsonDecode(result.body);
//       priceforit.value = jsonResult['price_for_it'];
//       adress.value = jsonResult['adress'];
//       minimal_price.value = jsonResult['minimal_price'];
//       rating.value = jsonResult['rating'];
//       rating_name.value = jsonResult['rating_name'];
//       description.value = jsonResult['about_the_hotel']['description'];
//        final peculiaritiesList = jsonResult['about_the_hotel']['peculiarities'];
//         if (peculiaritiesList is List<dynamic>) {
//           peculiarities.value = peculiaritiesList;
//         }
//       log('response ===> ${jsonResult}');

//       log('response ==> ${result.body}');
//       log('response json ==> ${jsonResult}');
//     } catch (e) {
//       log('$e');
//       throw Exception(e);
//     }
//   }
// }
import 'dart:developer';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeViewController extends GetxController {
  Rx<String> priceforit = ''.obs;
  Rx<String> adress = ''.obs;
  Rx<int> minimal_price = 0.obs;
  Rx<int> rating = 0.obs;
  Rx<String> rating_name = ''.obs;
  Rx<String> description = ''.obs;
  RxList<dynamic> peculiarities = <dynamic>[].obs;
  Rx<String> imageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    showWeatherByLocation(); // Нет необходимости делать await здесь
  }

  Future<void> showWeatherByLocation() async {
    await getData();
  }

  Future<void> getData() async {
    try {
      final client = http.Client();
      final url =
          'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3';
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(response.body);

        priceforit.value = jsonResult['price_for_it'];
        adress.value = jsonResult['adress']; // Исправлено название переменной
        minimal_price.value = jsonResult['minimal_price'];
        rating.value = jsonResult['rating'];
        rating_name.value = jsonResult['rating_name'];
        description.value = jsonResult['about_the_hotel']['description'];
        imageUrl.value = jsonResult['image_urls'];

        // Проверяем, что "peculiarities" - это список, прежде чем присваивать значение
        final peculiaritiesList =
            jsonResult['about_the_hotel']['peculiarities'];
        if (peculiaritiesList is List<dynamic>) {
          peculiarities.value = peculiaritiesList;
        }
        log('response ===> ${jsonResult}');
      } else {
        throw Exception('Ошибка при получении данных: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Произошла ошибка: $e');
    }
  }
}
