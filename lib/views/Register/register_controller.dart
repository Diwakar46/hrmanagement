import 'package:get/get.dart';
import 'package:hrmanagement/api/api_client.dart';
import 'package:hrmanagement/constants/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends GetxController {
  Future<void> register(String firstName, String middleName, String lastName,
      String email) async {
    var url = Uri.parse(ApiClient.baseUrl + ApiClient.endPoint);
    var body = {
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "email": email,
    };
    var headers = {
      'Content-Type': 'application/json',
      'Content-Length': '${jsonEncode(body).length}',
    };

    try {
      var response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        Get.snackbar('Registered', 'Registration done Sucessfully');
        Get.back();
      } else {
        Get.snackbar('Failed', 'Error during Registration',
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: MyColors.kerror);
      }
    } catch (e) {
      print('error while registration$e');
      Get.snackbar('Failed', 'Error:$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: MyColors.kerror);
    }
  }
}
