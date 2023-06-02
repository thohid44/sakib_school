import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sakib_school/Utils/localstorekey.dart';

class ApiService {
  static String baseUrl = 'https://edufiy.alivedevs.cf/api';
  static var client = http.Client();
  var token = '';

  final _box = GetStorage();
  var isLoading = false.obs;
//sPoint,des,note, prefered,howmany, currency,vehicled

  postData(mapData, String path) async {
// var token = _box.read(LocalStoreKey.token);
    var token = "113|xUpknkIcP6H1u8EeajwKSaP8YOmcCNVaL1MIOhFh"; 

    try {
      isLoading(true);
      var response =
          await http.post(Uri.parse(baseUrl+path),
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + token,
              },
              body: mapData);
      if (response.statusCode == 201) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        Get.snackbar("Get Ride", "Successfully Store",
            backgroundColor: Colors.deepOrange);
      }
    } catch (e) {
      print("Error $e");
    }
  }
   getData(String path) async {
// var token = _box.read(LocalStoreKey.token);
    var token = "113|xUpknkIcP6H1u8EeajwKSaP8YOmcCNVaL1MIOhFh"; 

    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse(baseUrl+path),
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + token,
              },
         );
      if (response.statusCode == 201) {
      
        var jsonData = jsonDecode(response.body);
       print(jsonData);
     
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
