import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TheTaskList());
}

class TheTaskList extends StatelessWidget {
  const TheTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "The Task List",
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: SplashScreen(),
    );
  }
}