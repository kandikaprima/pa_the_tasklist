import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/pages/splash_page.dart';
import 'package:pa_the_tasklist/themes.dart';
import 'package:pa_the_tasklist/utils/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TheTaskList());
}

class TheTaskList extends StatelessWidget {
  const TheTaskList({Key? key}) : super(key: key);
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          home: SplashScreen(),
        ),
      ),
    );
  }
}