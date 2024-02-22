import 'package:get/get.dart';

class EmployeeController extends GetxController {
  RxBool showText = false.obs;
  void showTextFunction() {
    showText.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      showText.value = false;
    });
  }
}
