import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakib_school/Parents/Profile/controller/parent_profile_controller.dart';
import 'package:sakib_school/pages/Teachers/Profile/model/teacher_profile_model.dart';

class ParentProfile extends GetView<ParentProfileController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ParentProfileController());
    controller.getProfile();
    controller.profile.reactive; 
    return Scaffold(
        appBar: AppBar(
          title: Text("Parent's Profile"),
        ),
        body: Obx(() => ListView(
              children: [
                Container(
                  child: Text(controller.profile!.email.toString()),
                )
              ],
            )));
  }
}
