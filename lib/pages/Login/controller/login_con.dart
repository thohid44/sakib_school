import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sakib_school/Utils/preKey.dart';
import 'package:sakib_school/pages/Teachers/Home/view/home_screen.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;

  String url = "https://edufiy.alivedevs.cf";
  final _box = GetStorage();
  var userClient = http.Client();
  login(email, password) async {
    try {
      isLoading(true);
      var response = await http.post(
          Uri.parse("$url/api/teacher/login"), 
          headers: {'Accept':"application/json"}, 
          body: {"email":"xoqulyvy@mailinator.com",
"password":"123123123",
"role_id":'5'
      }
          );
      var jsonData = jsonDecode(response.body);
      
      if (response.statusCode == 201) {
        print(jsonData); 
        var token = jsonData['token']; 
        _box.write(Prekey.token,token);
        
        if(token!=null){
          Get.to(HomeScreen()); 
        }
    } else {
      Get.snackbar(
        "Login Error",
        "User name or Password is Wrong",
        duration: Duration(seconds: 2),
      
      );
    }
      
    } catch (e) {
      print("Error $e");
    }
  }
  logOut() async{
    
  }
}