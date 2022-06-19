import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_the_tasklist/model/user.dart';
import 'package:pa_the_tasklist/utils/user_preferences.dart';
import 'package:pa_the_tasklist/widget/appbar_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String imageP = 'assets/profil2.png';
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              GestureDetector(
                  onTap: () {
                    if (imageP == 'assets/profil2.png') {
                      imageP = 'assets/profil1.png';
                    } else if (imageP == 'assets/profil1.png') {
                      imageP = 'assets/profil3.png';
                    } else if (imageP == 'assets/profil3.png') {
                      imageP = 'assets/profil4.png';
                    } else if (imageP == 'assets/profil4.png') {
                      imageP = 'assets/profil5.png';
                    } else if (imageP == 'assets/profil5.png') {
                      imageP = 'assets/profil6.png';
                    } else if (imageP == 'assets/profil6.png') {
                      imageP = 'assets/profil7.png';
                    } else {
                      imageP = 'assets/profil2.png';
                    }
                    setState(() {});
                  },
                  child: CircleAvatar(
                    maxRadius: 60.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(imageP),
                  )),
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
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => Container(
        padding: EdgeInsets.only(top: 10),
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}