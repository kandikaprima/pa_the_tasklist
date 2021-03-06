import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pa_the_tasklist/widgets/custom_text_field.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key,
  required this.username,
  }) : super(key: key);

  final String username;

  @override
  State<InputPage> createState() => _InputState();
}

enum Kategori { harian, mingguan, bulanan}

class _InputState extends State<InputPage> {
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
    return "bulanan";
  }

  final titleCtrl = TextEditingController();
  final deskripsiCtrl = TextEditingController();

  @override
    void dispose() {
      titleCtrl.dispose();
      deskripsiCtrl.dispose();
      super.dispose();
    }

  @override
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
                    Text("Task Berhasil di tambahkan"),
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
        title: Text("Input Page"),
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
                      child: Text(
                        "Input Task Form",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      )
                    ),
                  ),
                  CustomTextField(
                    title: "Task Name",
                    hint: "Nama Task",
                    controller: titleCtrl,
                  ),
                  CustomTextField(
                    title: "Deskripsi",
                    hint: "Deskripsi Task",
                    controller: deskripsiCtrl,
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
                      labelText: "Tanggal Task",//label text of field
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100)
                      );
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
          task.add({
            'title': titleCtrl.text,
            'tanggal': dateinput.text,
            'deskripsi': deskripsiCtrl.text,
            'user': widget.username,
            'kategori': getKategori(kategori),
          });
          CustomAlert(context);
            Timer(
              Duration(seconds: 3), () =>
              Get.back()
            );
        }, 
        tooltip: "Input Button",
        child: Icon(Icons.add)
      ),
    );
  }
}