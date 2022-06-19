import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/task_controller.dart';
import 'package:pa_the_tasklist/pages/input_task_page.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key,
  required this.title,
  required this.tanggal,
  required this.deskripsi,
  required this.kategori
  }) : super(key: key);

  final TaskController textInputan = Get.put(TaskController());

  final String title, tanggal, deskripsi, kategori;

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference users = firestore.collection("task");
    TaskController tc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Task"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(child: 
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style:TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    tanggal,
                    style:TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ),
            Text(
              "Harian",
              style:TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15,),
            Text(deskripsi),
            
            // CustomCardTask( 
            //   title,
            //   tanggal,
            //   deskripsi,
            //   onTap: () {

            //   },
            // ),
            // StreamBuilder<QuerySnapshot>(
            //       stream: users.snapshots(),
            //       builder: (_, snapshot) {
            //         return (snapshot.hasData)
            //             ? Column(
            //                 children: snapshot.data!.docs
            //                     .map(
            //                       (e) => CustomCardTask(
            //                         e.get('title'),
            //                         e.get('tanggal'),
            //                         e.get('deskripsi'),
            //                         onTap: () {
            //                           tc.onPresses();
            //                           users.doc(e.id).update({
            //                             'title' : tc.title.value,
            //                             'tanggal' : tc.tanggal.value,
            //                             'deskripsi' : tc.deskripsi.value,
            //                           });
            //                           tc.titleCtrl.text = '';
            //                           tc.deskripsiCtrl.text = '';
            //                           tc.tanggalCtrl.text = '';
            //                         },
            //                       ),
            //                     )
            //                     .toList(),
            //               )
            //             : Text('Loading...');
            //       },
            //     ),
            //     SizedBox(height: 150)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(InputPage(true));
        }, 
        tooltip: 'Edit Task', 
        child: Icon(Icons.edit)
      ),
    );
  }
}