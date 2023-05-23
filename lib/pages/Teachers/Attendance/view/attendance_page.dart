import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakib_school/Utils/colors.dart';
import 'package:sakib_school/pages/Teachers/Attendance/controller/student_controller.dart';
import 'package:sakib_school/pages/Teachers/Section/controller/SectionController.dart';

import '../../Classes/controller/ClassesController.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  var stdCon = Get.put(StudentController());
  var classId;
  var sectionId;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    var conCls = Get.put(ClassesController());
    conCls.fetchClass();
    var sectionController = Get.put(SectionController());
    sectionController.getSection();
    print(sectionController.sections.length);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        centerTitle: true, 
        backgroundColor: baseColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150.w,
                    height: 40.h,
                    padding: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(border: Border.all(width: 1.w)),
                    child: GetBuilder<ClassesController>(builder: (context) {
                      return DropdownButton(
                          hint: Text('Select Class '),
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: classId,
                          items: conCls.classList
                              .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(
                                      "${e.name}",
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            classId = value;
                            if (classId != null && sectionId != null) {
                              setState(() {
                                status = true;
                              });
                              stdCon.getStudent(classId, sectionId);
                            }
                          });
                    }),
                  ),
                  Container(
                    width: 150.w,
                    height: 40.h,
                    padding: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(border: Border.all(width: 1.w)),
                    child: GetBuilder<SectionController>(builder: (context) {
                      return DropdownButton(
                          hint: Text('Select Section '),
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: sectionId,
                          items: sectionController.sections
                              .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(
                                      "${e.name}",
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            sectionId = value;
                            if (classId != null && sectionId != null) {
                              setState(() {
                                status = true;
                              });
                              stdCon.getStudent(classId, sectionId);
                            }
                          });
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          status==true?  Container(
              height: 500.h,
              child: GetBuilder<StudentController>(builder: (context) {
                return ListView.builder(
                    itemCount:  stdCon.students.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          stdCon.students[index].userName.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Switch(value: true, onChanged: (value){

                        }),
                      );
                    });
              }),
            ): Center(child: Text("Select Date, Class and Section",
                style: TextStyle(color: Colors.black, fontSize: 20.sp, ),),)
          ],
        ),
      ),
    ));
  }
}
