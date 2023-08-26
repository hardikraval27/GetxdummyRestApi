import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model_rest.dart';

class HomeController extends GetxController {
  var restList = <Data>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fatchrest();
  }

  Future<void> fatchrest() async {
    isLoading.value = true;
    final response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
    final responsed = jsonDecode(response.body);

    if (response.statusCode == 200 && responsed['status'] == 'success') {
      print(responsed);
      restList.addAll(
          List.from(responsed['data']).map((e) => Data.fromJson(e)).toList());
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Server responsed:${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
