import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/task_controller.dart';
import 'package:pa_the_tasklist/pages/about.dart';
import 'package:pa_the_tasklist/pages/detail_page.dart';
import 'package:pa_the_tasklist/pages/drawer/bulanan_page.dart';
import 'package:pa_the_tasklist/pages/drawer/harian_page.dart';
import 'package:pa_the_tasklist/pages/drawer/mingguan_page.dart';
import 'package:pa_the_tasklist/pages/input_task_page.dart';
import 'package:pa_the_tasklist/pages/login_page.dart';
import 'package:pa_the_tasklist/widgets/custom_card_task.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

  final TaskController textInputan = Get.put(TaskController());
  String imagePath = 'assets/profil2.png';

class _HomepageState extends State<Homepage> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.black),
              child: DrawerHeader(
                child: GestureDetector(
                  onTap: () {
                    if (imagePath == 'assets/profil2.png') {
                      imagePath = 'assets/profil1.png';
                    } else if (imagePath == 'assets/profil1.png') {
                      imagePath = 'assets/profil3.png';
                    } else if (imagePath == 'assets/profil3.png') {
                      imagePath = 'assets/profil4.png';
                    } else if (imagePath == 'assets/profil4.png') {
                      imagePath = 'assets/profil5.png';
                    } else if (imagePath == 'assets/profil5.png') {
                      imagePath = 'assets/profil6.png';
                    } else if (imagePath == 'assets/profil6.png') {
                      imagePath = 'assets/profil7.png';
                    } else {
                      imagePath = 'assets/profil2.png';
                    }
                    setState(() {
                      
                    });
                  },
                  child: CircleAvatar(
                    maxRadius: 60.0,
                    backgroundColor: Colors.black,
                    child: Image.asset(imagePath),
                  )),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: const Text('Daily'),
              onTap: () => Get.to(HarianPage())
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: const Text('Weekly'),
              onTap: () => Get.to(MingguanPage())
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: const Text('Monthly'),
              onTap: () => Get.to(BulananPage())
            ),
            Divider(height: 25, thickness: 1),
            const Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 420),
              child: Text("More",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: const Text('About'),
              onTap: () => Get.to(about())
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Get.off(LoginPage())
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: task.where('user', isEqualTo: tc.username.value).snapshots(),
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
                        onDelete: () {
                          task.doc(e.id).delete();
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

// class Homepage extends StatelessWidget {
//   Homepage({Key? key}) : super(key: key);
//   final TaskController textInputan = Get.put(TaskController());
//   String imagePath = 'assets/profil2.png';

//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference task = firestore.collection("task");
//     TaskController tc = Get.find();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//         backgroundColor: Colors.black,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             Container(
//               decoration: BoxDecoration(color: Colors.black),
//               child: DrawerHeader(
//                 child: GestureDetector(
//                   onTap: () {
//                     if (imagePath == 'assets/profil2.png') {
//                       imagePath = 'assets/profil1.png';
//                     } else if (imagePath == 'assets/profil1.png') {
//                       imagePath = 'assets/profil3.png';
//                     } else if (imagePath == 'assets/profil3.png') {
//                       imagePath = 'assets/profil4.png';
//                     } else if (imagePath == 'assets/profil4.png') {
//                       imagePath = 'assets/profil5.png';
//                     } else if (imagePath == 'assets/profil5.png') {
//                       imagePath = 'assets/profil6.png';
//                     } else if (imagePath == 'assets/profil6.png') {
//                       imagePath = 'assets/profil7.png';
//                     } else {
//                       imagePath = 'assets/profil2.png';
//                     }
//                   },
//                   child: CircleAvatar(
//                     maxRadius: 60.0,
//                     backgroundColor: Colors.white,
//                     child: Image.asset(imagePath),
//                   )),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.list),
//               title: const Text('Daily'),
//               onTap: () => Get.to(HarianPage())
//             ),
//             ListTile(
//               leading: Icon(Icons.list),
//               title: const Text('Weekly'),
//               onTap: () => Get.to(MingguanPage())
//             ),
//             ListTile(
//               leading: Icon(Icons.list),
//               title: const Text('Monthly'),
//               onTap: () => Get.to(BulananPage())
//             ),
//             Divider(height: 25, thickness: 1),
//             const Padding(
//               padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 420),
//               child: Text("More",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                 )
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.info_rounded),
//               title: const Text('About'),
//               onTap: () => Get.to(about())
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () => Get.off(LoginPage())
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(12),
//         child: ListView(
//           children: [
//             StreamBuilder<QuerySnapshot>(
//               stream: task.where('user', isEqualTo: tc.username.value).snapshots(),
//               builder: (_, snapshot) {
//                 return (snapshot.hasData)
//                   ? Column(
//                     children: snapshot.data!.docs.map(
//                       (e) => CustomCardTask(
//                         e.get('title'),
//                         e.get('tanggal'),
//                         e.get('deskripsi'),
//                         e.get('kategori'),
//                         onTap: () {
//                           Get.to(
//                             DetailPage(
//                               title: e.get('title'),
//                               tanggal: e.get('tanggal'),
//                               deskripsi: e.get('deskripsi'),
//                               kategori: e.get('kategori'),
//                               id: e.id,
//                             ),
//                           );
//                         },
//                         onDelete: () {
//                           task.doc(e.id).delete();
//                         },
//                       )
//                     ).toList(),
//                   )
//                   : Text('Loading...');
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.black,
//         onPressed: () {
//           Get.to(InputPage(username: tc.username.value));
//         }, 
//         tooltip: 'Input Task', 
//         child: Icon(Icons.add)
//       ),
//     );
//   }
// }