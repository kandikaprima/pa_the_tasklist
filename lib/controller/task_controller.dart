import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{
  var title = ''.obs;
  var deskripsi = ''.obs;
  var tanggal = ''.obs;
  var username = ''.obs;

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController deskripsiCtrl = TextEditingController();
  final TextEditingController tanggalCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();

  onLogin(){
    username(usernameCtrl.text);
    username.value = usernameCtrl.text;
  }

  onPresses(){
    title(titleCtrl.text);
    title.value = titleCtrl.text;
    deskripsi(deskripsiCtrl.text);
    deskripsi.value = deskripsiCtrl.text;
    tanggal(tanggalCtrl.text);
    tanggal.value = tanggalCtrl.text;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    titleCtrl.dispose();
    deskripsiCtrl.dispose();
    tanggalCtrl.dispose();
    super.onClose();
  }
}