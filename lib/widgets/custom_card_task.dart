import 'package:flutter/material.dart';
class CustomCardTask extends StatelessWidget {
  // const CustomCardTask({Key? key}) : super(key: key);

  final String title;
  final String tanggal;
  final String deskripsi;
  final String kategori;
  final VoidCallback? onTap;
  final Function? onDelete;
  // final bool canDelete;

  CustomCardTask(this.title, this.tanggal, this.deskripsi, this.kategori, {this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(tanggal),
              ],
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: const Center(
                  child: Icon(
                    Icons.delete,
                    color:  Colors.white,
                  ),
                ),
                onPressed: () {
                  if (onDelete != null) onDelete!();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}