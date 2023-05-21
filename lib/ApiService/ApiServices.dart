import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sakib_school/Utils/constant.dart';
import 'package:sakib_school/Utils/preKey.dart';

import '../pages/Home/view/home_screen.dart';

class ApiServices {
  var clint = http.Client();
  final _box = GetStorage(); 

  var isLoading = false.obs;
   String baseUrl = "https://edufiy.alivedevs.cf/api";

  Future getData(path) async {
   //var token = _box.read(Prekey.token);
   var token ="79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
    try {
      var response = await clint.get(
        Uri.parse("https://edufiy.alivedevs.cf/api/teacher/class"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer '+token,
        },
      );
    } catch (e) {
      print("Print Error $e");
    }
  }

  var userClient = http.Client();
  postData(para,path) async {
    try {
      isLoading(true);
      var response = await http.post(Uri.parse(baseUrl+path),
          headers: {
            'Accept': "application/json"
          },
          body: {
            "email": "xoqulyvy@mailinator.com",
            "password": "123123123",
            "role_id": '5'
          });
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        print(jsonData);
        var token = jsonData['token'];
        if (token != null) {
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
}
