import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakib_school/Utils/localstorekey.dart';
import 'package:sakib_school/Utils/preKey.dart';
import 'package:sakib_school/pages/Teachers/Attendance/model/student_list_model.dart';

import 'package:http/http.dart' as http;
import 'package:sakib_school/pages/Teachers/Section/model/class_To_sec_Model.dart';

import '../model/student_model.dart';

class StudentController extends GetxController {
  var isLoading = false.obs;
  List<StudentListModel> studentModel = <StudentListModel>[].obs;
  var clint = http.Client();
  List<Map> sendAttendance = <Map>[].obs;

  Future<StudentListModel?> getStudent() async {
    var token = "79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
    try {
      isLoading(true);
      var response = await clint.post(
          Uri.parse("https://edufiy.alivedevs.cf/api/teacher/attendance"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
          body: {
            "class_id": "1",
            "section_id": "1"
          });
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        SectionToStdListModel data = SectionToStdListModel.fromJson(jsonData);

        studentModel = data.data!;

        sendAttendance = studentModel.map((e) {
          return {
            "student_id": e.id,
            "status": true,
          };
        }).toList();
    
        update();
      }
    } catch (e) {
      print("Print Error $e");
    }
    update();
  }

  final _box = GetStorage();
}
