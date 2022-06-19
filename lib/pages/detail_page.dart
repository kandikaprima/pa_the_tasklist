import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/task_controller.dart';
import 'package:pa_the_tasklist/pages/edit_task_page.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key,
  required this.title,
  required this.tanggal,
  required this.deskripsi,
  required this.kategori,
  required this.id
  }) : super(key: key);

  final TaskController textInputan = Get.put(TaskController());

  final String title, tanggal, deskripsi, kategori, id;

  @override
  Widget build(BuildContext context) {
    TaskController tc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Task"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style:const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    tanggal,
                    style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ),
            const SizedBox(height: 10,),
            Text(
              kategori,
              style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15,),
            Text(deskripsi),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(EditPage(
            titleTask: title,
            date: tanggal,
            deskripsi: deskripsi,
            kategori: kategori,
            userName: tc.username.value,
            id: id,
          ));
        },
        tooltip: 'Edit Task', 
        child: Icon(Icons.edit)
      ),
    );
  }
}