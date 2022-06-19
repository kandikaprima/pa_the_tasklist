import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pa_the_tasklist/widgets/custom_text_field.dart';

class EditPage extends StatefulWidget {
  const EditPage(
    {Key? key,
    required this.titleTask,
    required this.date,
    required this.deskripsi,
    required this.kategori,
    required this.userName,
    required this.id
    }) : super(key: key);

  final String titleTask, date, deskripsi, kategori,userName, id;

  @override
  State<EditPage> createState() => _EditState();
}

enum Kategori { harian, mingguan, bulanan}

class _EditState extends State<EditPage> {
  final TextEditingController dateinput = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Kategori kategori = Kategori.harian;
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  getKategori(Kategori value) {
    if (value == Kategori.harian) {
      return "harian";
    } else if (value == Kategori.mingguan) {
      return "mingguan";
    }
    return 'bulanan';
  }

  final titleCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  @override
  void dispose() {
    titleCtrl.dispose();
    noteCtrl.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference task = firestore.collection("task");
    Future<dynamic> CustomAlert(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
                height: 100,
                child: Column(
                  children: const [
                    Text("Task Berhasil di ubah"),
                  ],
                )),
            actions: [
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Back")),
              )
            ],
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page",),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 1.1,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 25,
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: const Center(
                      child: Text("Edit Task From",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      )
                    ),
                  ),
                  CustomTextField(
                    title: "Judul Task",
                    hint: widget.titleTask,
                    controller: titleCtrl,
                  ),
                  CustomTextField(
                    title: "Deskripsi task",
                    hint: widget.deskripsi,
                    controller: noteCtrl,
                    maxLines: 12,
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    "Kategori Task:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  ListTile(
                    title: Text("Harian"),
                    leading: Radio(
                      groupValue: kategori,
                      value: Kategori.harian,
                      onChanged: (Kategori? value) {
                        setState(() {
                          kategori = value!;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: Text("Mingguan"),
                    leading: Radio(
                      groupValue: kategori,
                      value: Kategori.mingguan,
                      onChanged: (Kategori? value) {
                        setState(() {
                          kategori = value!;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: Text("Bulanan"),
                    leading: Radio(
                      groupValue: kategori,
                      value: Kategori.bulanan,
                      onChanged: (Kategori? value) {
                        setState(() {
                          kategori = value!;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  TextField(
                    controller: dateinput, //editing controller of this TextField
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today,), //icon of text field
                      labelText: "Tanggal Task Terbaru",//label text of field
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement
                        setState(() {
                          dateinput.text = formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    }
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          task.doc(widget.id).update({
            'title': titleCtrl.text,
            'tanggal': dateinput.text,
            'deskripsi': noteCtrl.text,
            'user': widget.userName,
            'kategori': getKategori(kategori),
          });
          Timer(
            Duration(seconds: 1),
            () => Get.back()
          );
        },
        tooltip: "Edit Button",
        child: Icon(Icons.edit)
      ),
    );
  }
}