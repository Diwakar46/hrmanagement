import 'package:get/get.dart';

class HomeController extends GetxController {
  var isOff = false.obs;
  void toogleTheme(bool value) {
    value = isOff.value;
    // _isOff cant be assigined directly _isOff = value because _isOff is Rxbool and value is bool
  }
}
