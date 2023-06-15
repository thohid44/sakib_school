import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:sakib_school/Utils/localstorekey.dart';
import 'package:sakib_school/Utils/preKey.dart';
import 'package:sakib_school/pages/Teachers/Section/model/SectionModel.dart';
import 'package:sakib_school/pages/Teachers/Section/model/class_To_sec_Model.dart';

class SectionController extends GetxController {
  var isLoading = false.obs;

  var clint = http.Client();
  List<Section> sections = <Section>[].obs;
  final _box = GetStorage();
  getSection() async {
    var token = _box.read(Prekey.token);

    print("section Token $token");
    try {
      isLoading(true);
      var response = await clint.get(
        Uri.parse("https://edufiy.alivedevs.cf/api/teacher/class-to-section/1"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (response.statusCode == 201) {
        ClassToSectionModel data = ClassToSectionModel.fromJson(jsonData);
        sections = data.data!.section!; 
        print("section ${sections.length}");
        update();
      }
    } catch (e) {
      print("Print Error $e");
    }
    update();
  }
}
