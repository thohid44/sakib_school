import 'dart:convert';

import 'package:get/get.dart';
import 'package:sakib_school/ApiService/ApiServices.dart';
import 'package:sakib_school/pages/Teachers/Classes/model/ClassModel.dart';
import 'package:http/http.dart' as http;

class ClassesController extends GetxController {
  var isLoading = false.obs;
  List<Classes> classList = <Classes>[].obs;
  ClassModel? cls;
  var clint = http.Client();

  Future<ClassModel?> fetchClass() async {
    var token = "79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
    try {
      classList.clear(); 
      isLoading(true);
      var response = await clint.get(
        Uri.parse("https://edufiy.alivedevs.cf/api/teacher/class"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      // print(jsonDecode(response.body));
      if (response.statusCode == 201) {
        ClassModel data = ClassModel.fromJson(jsonData);
        
        classList = data.data!;
        update();
      }
    } catch (e) {
      print("Print Error $e");
    }
  }
}
