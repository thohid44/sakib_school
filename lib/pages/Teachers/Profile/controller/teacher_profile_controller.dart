import 'dart:convert';

import 'package:get/get.dart';

import '../model/teacher_profile_model.dart';
import 'package:http/http.dart' as http;

class TeacherProfileController extends GetxController {
  Profile? profile;
  Future<TeacherProfileModel?> getProfile() async {
    var isLoading = false.obs;
    var clint = http.Client();
    var token = "79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
    try {
      isLoading(true);
      
      var response = await clint.get(
        Uri.parse("https://edufiy.alivedevs.cf/api/teacher/profile"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print(jsonData); 
        TeacherProfileModel data = TeacherProfileModel.fromJson(jsonData);
        profile = data.data!;
      
      }
    } catch (e) {
      print("Print Error $e");
    }
   
  }
}
