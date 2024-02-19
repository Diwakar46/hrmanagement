import 'dart:convert';
import 'package:get/get.dart';
import 'package:hrmanagement/api/api_client.dart';
import 'package:hrmanagement/api/jwt_response.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/views/HomePage/home_page.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  Future<void> login(String email, String password) async {
    var url = Uri.parse(ApiClient.baseUrl + ApiClient.endPoint);
    print(url);
    var body = {
      "username": email,
      "password": password,
    };

    var headers = {
      'Content-Type': 'application/json',
      'Content-Length': '${jsonEncode(body).length}',
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var jwtResponse = JwtResponse.fromJson(responseData);
        if (jwtResponse.roles != null &&
            jwtResponse.roles!.contains('ROLE_ADMIN')) {
          Get.to(HomePage()); //admin Homepage ma login
        } else {
          // Get.to(HomePage()); => User home page ma login
        }
        Get.to(HomePage());
        Get.snackbar('Sucess', 'Logged in sucessfully:',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: MyColors.kgreen);
      } else {
        Get.snackbar('Failed', 'Error While LoginIn error',
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: MyColors.kerror);
      }
    } catch (e) {
      print('error while signing$e');
      Get.snackbar('Failed', 'Error:$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: MyColors.kerror);
    }
  }
}


//  "username": 'diwakar@gmail.com',
//       "password": '5267Diw@,

//this is function for fetching data from the api

  // Future<Map<String, dynamic>> fetchData() async {
    //   var fetchedData;
    //   try {
    //     var response = await http.get(url, headers: headers);
    //     if (response.statusCode == 200) {
        // if (roleData['roles'] == 'ROLE_ADMIN') {
    //       fetchedData = jsonDecode(response.body);
    //     } else
    //       () {
    //         print('Error while fetching data ${response.statusCode}');
    //       };
    //   } catch (e) {
    //     print('Error while fetching data $e');
    //   }
    //   return fetchedData;
    // }

    // var roleData = await fetchData();
    // var roles = roleData['roles'];
    // print('The role is : $roles');

    // var url = Uri.parse('{base()}users/signin');
    //a home page in which only admin can go
        // } else {
        //   print('this is loging in for users');
        //   Get.to(HomePage());
        // }

