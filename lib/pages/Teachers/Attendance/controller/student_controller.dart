import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakib_school/pages/Teachers/Attendance/model/student_list_model.dart';

import 'package:http/http.dart' as http;


class StudentController extends GetxController {
  var isLoading = false.obs;
  List<StudentsModel> studentModel = <StudentsModel>[].obs;
  var clint = http.Client();
  List<Map> sendAttendance = <Map>[].obs;

  Future<StudentListModel?> getStudent() async {
    var token = "79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
    try {
      isLoading(true);
      var response = await clint.get(
        Uri.parse("https://edufiy.alivedevs.cf/api/teacher/student-list"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 201) {
        StudentListModel data = StudentListModel.fromJson(jsonData);
        studentModel = data.data!;
        sendAttendance = studentModel.map((e) {
          return {
            "student_id": e.id.toString(),
            "status": true,
          };
        }).toList();
        print(sendAttendance.first);
        update();
      }
    } catch (e) {
      print("Print Error $e");
    }
    update();
  }

  final _box = GetStorage();
  
}
