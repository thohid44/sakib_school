import 'dart:convert';

import 'package:get/get.dart';
import 'package:sakib_school/ApiService/ApiServices.dart';
import 'package:sakib_school/pages/Teachers/Classes/model/ClassModel.dart';
import 'package:http/http.dart' as http;
import 'package:sakib_school/pages/Teachers/Section/model/SectionModel.dart';

class SectionController extends GetxController {
  var isLoading = false.obs;

  var clint = http.Client();
  List<Sections> sections = <Sections>[].obs;

  Future<SectionsModel?> getSection() async {
    var token = "79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
    try {
      var response = await clint.get(
        Uri.parse("https://edufiy.alivedevs.cf/api/teacher/section"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' +token,
        },
      );
      var jsonData = jsonDecode(response.body);
      // print(jsonDecode(response.body));
      if (response.statusCode == 201) {
        SectionsModel data = SectionsModel.fromJson(jsonData);
        sections = data.data!;
        update(); 
      }
    } catch (e) {
      print("Print Error $e");
    }
    update();
  }
}
