import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashScreenController ssc = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo-v2.png",
              width: double.infinity,
            ),
            const SizedBox(height: 35,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}