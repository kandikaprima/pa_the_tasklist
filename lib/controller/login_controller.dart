import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var username = ''.obs;
  var password = ''.obs;

  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwprdCtrl = TextEditingController();

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   usernameCtrl.dispose();
  //   passwprdCtrl.dispose();
  //   super.onClose();
  // }
}