import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakib_school/ApiService/ApiServices.dart';
import 'package:sakib_school/Parents/Profile/model/parents_profile_model.dart';
import 'package:http/http.dart' as http;

class ParentProfileController extends GetxController {
  Data? profile;

  var isLoading = false.obs;

  getProfile() async {
// var token = _box.read(LocalStoreKey.token);
    var token = "113|xUpknkIcP6H1u8EeajwKSaP8YOmcCNVaL1MIOhFh";

    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse('https://edufiy.alivedevs.cf/api/parent/profile'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 201) {
     

        ParentsProfileModel data = ParentsProfileModel.fromJson(jsonData);
        profile = data.data;
   
      }
    } catch (e) {
      print("Error $e");
    }
  
  }
}
