import 'dart:convert';

import 'package:get/get.dart';
import 'package:sakib_school/ApiService/ApiServices.dart';
import 'package:sakib_school/Parents/Profile/model/parentsModel.dart';

class ParentProfileController extends GetxController {
  getProfile() async {
    var response = await ApiService().getData("path");
    var jsonData = jsonDecode(response.body);
    if (response.StatusCode == 201) {
      ParentsProfile data = ParentsProfile.fromJson(jsonData); 
      
    }
  }
}
