import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakib_school/ApiService/ApiServices.dart';
import 'package:sakib_school/Parents/student/model/parent_students_model.dart';
import 'package:http/http.dart' as http;

class ParentStdsController extends GetxController {
  var isLoading = false.obs;
  static var client = http.Client();
  final _box = GetStorage();
  List<Datum> stdList = <Datum>[].obs;

  Future<ParentStudentsModel?> getParentStds() async {
    var token = "113|xUpknkIcP6H1u8EeajwKSaP8YOmcCNVaL1MIOhFh";
    stdList.clear(); 
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("https://edufiy.alivedevs.cf/api/parent/student-list"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);

      print("json data $jsonData");

      if (response.statusCode == 201) {
        ParentStudentsModel data = ParentStudentsModel.fromJson(jsonData);
         stdList = data.data!;
         print(stdList.length); 
        update();
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
