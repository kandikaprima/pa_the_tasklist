import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/task_controller.dart';
import 'package:pa_the_tasklist/pages/detail_page.dart';
import 'package:pa_the_tasklist/widgets/custom_card_task.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final TaskController textInputan = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference task = firestore.collection("task");
    TaskController tc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: task.snapshots(),
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
                            ),
                          );
                        },
                      )
                    ).toList(),
                  )
                  : Text('Loading...');
              },
            ),
            CustomCardTask(
              "Sepedaan",
              "22 Januari 2022",
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              "Harian",
              onTap: () {
                Get.to(
                  DetailPage(
                    title: "Sepedaan",
                    tanggal: "22 Januari 2022",
                    deskripsi: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    kategori: "Harian",
                  ),
                );
              }
            ),
            Text(tc.username.value),
          ],
        ),
      ),
    );
  }
}