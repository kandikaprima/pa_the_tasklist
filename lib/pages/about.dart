import 'package:flutter/material.dart';
import 'package:pa_the_tasklist/page/profile_page.dart';
import 'package:pa_the_tasklist/pages/about1.dart';

class about extends StatelessWidget {
  final List<Widget> tabBody = [ProfilePage(), about1()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Profile Page"),
            backgroundColor: Colors.black,
            bottom:
                const TabBar(tabs: [Tab(text: "Profile"), Tab(text: "About")]),
          ),
          body: TabBarView(children: tabBody),
        ));
  }
}
