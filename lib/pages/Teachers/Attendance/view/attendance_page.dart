import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Classes/controller/ClassesController.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  var classId; 
  @override
  Widget build(BuildContext context) {
         var conCls= Get.put(ClassesController()); 
    conCls.fetchClass(); 
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
            GetBuilder<ClassesController>(builder: (context) {
            return FutureBuilder(
              future: conCls.fetchClass(),
              builder:(context,snapshot){
           return   DropdownButton(
                hint: Text('Select Student '),
                underline: SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down),
                value: classId,
                items: snapshot.data!.data!
                    .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            "${e.name}",
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                
                });
            });
          }),
        ],
      ),
    ));
  }
}