import 'package:flutter/material.dart';
class CustomCardTask extends StatelessWidget {
  // const CustomCardTask({Key? key}) : super(key: key);

  final String title;
  final String tanggal;
  final String deskripsi;
  final String kategori;
  final VoidCallback? onTap;
  // final bool canDelete;

  CustomCardTask(this.title, this.tanggal, this.deskripsi, this.kategori, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
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
            // canDelete
            //   ? Flexible(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Container(
            //             width: 60,
            //             height: 60,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.redAccent,
            //             ),
            //             alignment: Alignment.center,
            //             child: Text(
            //               "Hapus",
            //               style: TextStyle(
            //                 color: Colors.white,
            //               ),
            //             ),
            //           )
            //         ],
            //       )
            //     )
            //   : SizedBox()
          ],
        ),
      ),
    );
  }
}