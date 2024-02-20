import 'dart:convert';
import 'package:get/get.dart';
import 'package:hrmanagement/api/api_client.dart';
import 'package:hrmanagement/api/jwt_response.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/views/HomePage/AdminHomePage/admin_home_page.dart';
import 'package:hrmanagement/views/HomePage/UserHomePage/user_home_page.dart';
import 'package:http/http.dart' as http;
import 'package:hrmanagement/Database/database.dart';

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
        print('status code:${response.statusCode}');
        var responseData = jsonDecode(response.body);
        var jwtResponse = JwtResponse.fromJson(responseData);
        var token = jwtResponse.token;
        var firstName = jwtResponse.firstname;
        var lastName = jwtResponse.lastname;
        var email = jwtResponse.email;
        var role = jwtResponse.roles;

        DatabaseHelper.insert(token, firstName, lastName, email, role);

        if (jwtResponse.roles != null &&
            jwtResponse.roles!.contains('ROLE_ADMIN')) {
          Get.to(AdminHome()); //  //admin Homepage ma login
          Get.snackbar('Sucess',
              'Logged in successfully.Redirecting to admin home page...',
              snackPosition: SnackPosition.BOTTOM,
              borderRadius: 3,
              backgroundColor: MyColors.kprimary);
        } else {
          Get.to(UserHome); //this will be user homePage
          Get.snackbar('Sucess',
              'Logged in successfully.Redirecting to user home page...',
              snackPosition: SnackPosition.BOTTOM,
              borderRadius: 3,
              backgroundColor: MyColors.kprimary);
        }
      } else {
        Get.snackbar(
            'Failed', 'Error occurred while logging in.Please try again later.',
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 3,
            backgroundColor: MyColors.kerror);
      }
    } catch (e) {
      print('error while $e');
      Get.snackbar('Failed', 'Error:$e',
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 3,
          backgroundColor: MyColors.kerror);
    }
  }
}


//  "username": 'diwakar@gmail.com',
//       "password": '5267Diw@,

//this is function for fetching data from the api another method

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

