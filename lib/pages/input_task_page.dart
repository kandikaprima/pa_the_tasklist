import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pa_the_tasklist/pages/detail_page.dart';
import 'package:pa_the_tasklist/widgets/custom_text_field.dart';

class InputPage extends StatefulWidget {
  // const InputPage({Key? key, this.isEdit = false}) : super(key: key);

  final bool isEdit;
  InputPage(this.isEdit);

  @override
  State<InputPage> createState() => _InputState();
}

enum Kategori { harian, mingguan, bulanan}

class _InputState extends State<InputPage> {
  TextEditingController dateinput = TextEditingController();
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

  Widget build(BuildContext context) {
    String title = "Nama Task";
    String note = "Deskripsi";
    String date = "";
    final titleCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    final dateCtrl = TextEditingController();
    final _dateController = TextEditingController();
    final _timeController1 = TextEditingController();
    final _timeController2 = TextEditingController();

    @override
    void dispose() {
      titleCtrl.dispose();
      noteCtrl.dispose();
      dateCtrl.dispose();
    }

    Future<dynamic> CustomAlert(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text("Success"),
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
    // final CounterController c = Get.put(CounterController());
    // final SwitchController swc = Get.put(SwitchController());
    // final GetxTextController tc = Get.put;
    // final GetxTextController tc = Get.find();

    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference datawidget = firestore.collection("widget");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? "Edit Page" : "True Page",
        ),
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
                    child: Center(
                        child: Text(
                      widget.isEdit ? "Edit Task From" : "Input Task Form",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    )),
                  ),
                  CustomTextField(
                    title: title,
                    hint: "Nama Task",
                    controller: titleCtrl,
                  ),
                  CustomTextField(
                    title: note,
                    hint: "Deskripsi Task",
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
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today,), //icon of text field
                      labelText: widget.isEdit ? "Tanggal Task Terbaru" : "Tanggal Task",//label text of field
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
                  widget.isEdit
                  ? SizedBox()
                  : Container(
                    padding: const EdgeInsets.only(top: 450),
                      child: ElevatedButton(
                          onPressed: () {
                            CustomAlert(context);
                            Timer(
                              Duration(seconds: 3), () =>
                              Get.back()
                            );
                          },
                          child: const Text('Add Task'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ))
                    ),
                  widget.isEdit
                  ? SizedBox()
                  : Container(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Back'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        )),
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
          Get.to(
            DetailPage(
              title: title,
              tanggal: date,
              deskripsi: note,
              kategori: "harian",
            )
          );
        }, 
        tooltip: widget.isEdit ? "Edit Button" : "Input Button",
        child: Icon(Icons.edit)
      ),
    );
  }
}