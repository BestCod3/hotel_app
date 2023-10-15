import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ChooseController extends GetxController {
  Rx<String> name = ''.obs;
  Rx<int> price = 0.obs;
  Rx<String> price_per = ''.obs;
  RxList<String> peculiarities = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    showWeatherByLocation();
  }

  Future<void> showWeatherByLocation() async {
    await getData();
  }

  Future<void> getData() async {
    try {
      final client = http.Client();
      final url =
          'https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd';
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(response.body);
        final List<dynamic> rooms = jsonResult['rooms'];

        if (rooms is List<dynamic> && rooms.isNotEmpty) {
          final firstRoom = rooms[0];
          final name = firstRoom['name'];
          final price = firstRoom['price'] as int;
          final price_per = firstRoom['price_per'];
          final peculiaritiesList = firstRoom['peculiarities'] as List<dynamic>;
          final peculiarities =
              peculiaritiesList.map((e) => e.toString()).toList();

          this.name.value = name;
          this.price.value = price;
          this.price_per.value = price_per;
          this.peculiarities.value.assignAll(peculiarities);
        } else {
          this.name.value = 'Название не найдено';
          this.price.value = 0;
          this.price_per.value = "notempty";
          this.peculiarities.value.clear();
        }

        log('response ===> ${jsonResult}');
      } else {
        throw Exception('Ошибка при получении данных: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Произошла ошибка: $e');
    }
  }

  Future<void> getData2() async {
    try {
      final client = http.Client();
      final url =
          'https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd';
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(response.body);
        final List<dynamic> rooms = jsonResult['rooms'];

        if (rooms is List<dynamic> && rooms.length >= 2) {
          // Проверьте, что есть элемент с айди 2
          final secondRoom =
              rooms[1]; // Используйте [1], так как индексация начинается с 0
          final name = secondRoom['name'];
          final price = secondRoom['price'] as int;
          final peculiaritiesList =
              secondRoom['peculiarities'] as List<dynamic>;
          final peculiarities =
              peculiaritiesList.map((e) => e.toString()).toList();

          this.name.value = name;
          this.price.value = price;
          this.peculiarities.assignAll(peculiarities);
        } else {
          this.name.value = 'Название не найдено';
          this.price.value = 0;
          this.peculiarities.clear();
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
