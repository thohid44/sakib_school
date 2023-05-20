import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sakib_school/pages/Home/view/home_screen.dart';

import '../../../Utils/constant.dart';

class LoginController extends GetxController {
  final _box = GetStorage();
  //https://edufiy.alivedevs.cf/api

  login(email, password) async {
    var response = await http.post(
      Uri.parse("https://edufiy.alivedevs.cf/api/teacher/login"),
      headers: {
        'Accept': 'application/json'
      },
      body: {
        "email": "xoqulyvy@mailinator.com",
"password":"123123123",
"role_id":"5"
      
    }
    );
    print("object");

    var jsonData = jsonDecode(response.body);
    print(jsonData);
    if (response.statusCode == 200) {
      print(jsonData); 
      var token = jsonData['token'];
     
     
    
      _box.write(token, token);
      
         Get.to(HomeScreen());
      
    }
    // } else {
    //   Get.snackbar(
    //     "Login Error",
    //     "User name or Password is Wrong",
    //     duration: Duration(seconds: 2),
    //     backgroundColor: Colors.green,
    //   );
    // }
  }
}
