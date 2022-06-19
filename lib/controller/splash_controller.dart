import 'dart:async';

import 'package:get/get.dart';
import 'package:pa_the_tasklist/pages/login_page.dart';

class SplashScreenController extends GetxController{

  @override
  void onReady() {
    Timer(
      const Duration(seconds: 5),() {
        Get.off(LoginPage());
      }
    );
    super.onReady();
  }
}