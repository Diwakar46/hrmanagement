import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmanagement/Database/database.dart';
import 'package:hrmanagement/Widgets/custom_button.dart';
import 'package:hrmanagement/constants/constants.dart';
import 'package:hrmanagement/views/Login/login.dart';

class AdminController extends GetxController {
  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      confirm: CustomElevatedButton(
        onPressed: () async {
          await DatabaseHelper.deleteItem();
          Get.back();
        },
        button_text: Text(
          'Cancel',
          style: TextStyle(
              color: MyColors
                  .kwhite), //here in confirm i have put text cancel to mantain the UI
        ),
        height: 60,
        width: double.infinity,
      ),
      cancel: CustomElevatedButton(
        onPressed: () {
          Get.offAll(LoginPage());
        },
        button_text: Text(
          'Ok',
          style: TextStyle(color: MyColors.kwhite),
        ),
        height: 60,
        width: double.infinity,
      ),
      middleText: '',
    );
  }
}
