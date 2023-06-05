import 'dart:convert';

import 'package:get/get.dart';

import 'package:sakib_school/pages/Teachers/Classes/model/ClassModel.dart';
import 'package:http/http.dart' as http;

import '../model/student_model.dart';

class StudentController extends GetxController {
  var isLoading = false.obs;
  List<Students> students = <Students>[].obs;
  var clint = http.Client();
List<Map> sendAttendance = <Map>[].obs; 
  Future<StudentModel?> getStudent(cls, sec) async {
    var token = "79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
    try {
      students.clear(); 
      isLoading(true);
      var response = await clint.get(
        Uri.parse(
            "https://edufiy.alivedevs.cf/api/teacher/attendance-list?date=18-03-2022&class_id=$cls&section_id=$sec"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 201) {
        StudentModel data = StudentModel.fromJson(jsonData);
        students = data.data!;
        sendAttendance = students.map((e) {
          return {
         "student_id": e.id.toString(),
            "status": true
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
}
