import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakib_school/Parents/Profile/controller/parent_profile_controller.dart';
import 'package:sakib_school/pages/Teachers/Profile/model/teacher_profile_model.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({super.key});

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  var controller = Get.put(ParentProfileController()); 
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(title: Text("Parent's Profile"),),
      body: FutureBuilder<ParentProfile?>(
        future:  controller.getProfile(),
        builder:(context, AsyncSnapshot snapshot){
        return ListView(children: [
          Container(
            child: Text(snapshot.data.data.name),
          )
        ],);
      })
    );
  }
}