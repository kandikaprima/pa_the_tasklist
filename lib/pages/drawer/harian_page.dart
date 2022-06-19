import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/task_controller.dart';
import 'package:pa_the_tasklist/pages/detail_page.dart';
import 'package:pa_the_tasklist/pages/input_task_page.dart';
import 'package:pa_the_tasklist/widgets/custom_card_task.dart';

class HarianPage extends StatelessWidget {
 HarianPage({Key? key}) : super(key: key);
  final TaskController textInputan = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference task = firestore.collection("task");
    TaskController tc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Task"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: task.where('user', isEqualTo: tc.username.value).where('kategori', isEqualTo: "harian").snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                  ? Column(
                    children: snapshot.data!.docs.map(
                      (e) => CustomCardTask(
                        e.get('title'),
                        e.get('tanggal'),
                        e.get('deskripsi'),
                        e.get('kategori'),
                        onTap: () {
                          Get.to(
                            DetailPage(
                              title: e.get('title'),
                              tanggal: e.get('tanggal'),
                              deskripsi: e.get('deskripsi'),
                              kategori: e.get('kategori'),
                              id: e.id,
                            ),
                          );
                        },
                      )
                    ).toList(),
                  )
                  : Text('Loading...');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(InputPage(username: tc.username.value));
        }, 
        tooltip: 'Input Task', 
        child: Icon(Icons.add)
      ),
    );
  }
}
