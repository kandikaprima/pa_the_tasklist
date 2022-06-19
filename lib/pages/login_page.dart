import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/task_controller.dart';
import 'package:pa_the_tasklist/pages/home_page.dart';
import 'package:pa_the_tasklist/widgets/custom_button.dart';
import 'package:pa_the_tasklist/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TaskController usernameInputan = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController passCtrl = TextEditingController();
    TaskController tc = Get.find();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: ListView(
          children: [
            SizedBox(height: 50,),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                width: double.infinity,
              ),
              SizedBox(height: 20,),
              CustomTextField(
                title: "Username",
                hint: "Masukkan username Anda",
                controller: usernameInputan.usernameCtrl,
              ),
              CustomTextField(
                title: "Password",
                hint: "Masukkan password Anda",
                isSecure: true,
                controller: passCtrl,
              ),
              SizedBox(height: 20,),
              CustomButton(
                text: "LOGIN",
                onTap: () {
                  tc.onLogin();
                  Get.off(Homepage());
                },
              ),
            ],
          ),
          ],
          
        ),
      ),
    );
  }
}