import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pa_the_tasklist/model/user.dart';
import 'package:pa_the_tasklist/utils/user_preferences.dart';
import 'package:pa_the_tasklist/widget/appbar_widget.dart';

class about1 extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<about1> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Image.asset(
                "assets/logo-v2.png",
                scale: 3.0,
                width: double.infinity,
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: const [
          SizedBox(height: 4),
        ],
      );

  Widget buildUpgradeButton() => Container(
        padding: const EdgeInsets.only(top: 10),
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About Team',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Efraim Romiyanto (1915016031)'
              '\nKandika Prima Putra (1915016013)'
              '\nMuhammad Ardhan (1915016)'
              '\nOloan Gultom (1915016001)',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
