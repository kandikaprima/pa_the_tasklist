import 'package:get/get.dart';
import 'package:pa_the_tasklist/controller/task_controller.dart';
import 'package:pa_the_tasklist/model/user.dart';

class UserPreferences {
  TaskController tc = Get.find();
  static const myUser = User(
    imagePath:
        'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1655557960~exp=1655558560~hmac=064ebed58359f1d1a66dcc4d4e00e247259b06017f457bd455ef2bb23ffdd8f5&w=740',
    name: 'Kelompok 4 G19',
    email: 'Kelompok4G19@gmail.com',
    about:'Kelompok 4 G19',
    isDarkMode: false,
  );
}
