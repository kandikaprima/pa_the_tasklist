import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{
  var title = ''.obs;
  var deskripsi = ''.obs;
  var tanggal = ''.obs;
  var username = ''.obs;
  var kategori = ''.obs;
  var date = ''.obs;

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController deskripsiCtrl = TextEditingController();
  final TextEditingController tanggalCtrl = TextEditingController();
  final TextEditingController kategoriCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController dateCtrl = TextEditingController();

  onLogin(){
    username(usernameCtrl.text);
    username.value = usernameCtrl.text;
  }

  // inputTask(){

  // }

  // editTask(){
    
  // }

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
    titleCtrl.dispose();
    deskripsiCtrl.dispose();
    tanggalCtrl.dispose();
    super.onClose();
  }
}