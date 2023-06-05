import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakib_school/Utils/colors.dart';
import 'package:sakib_school/pages/Teachers/Attendance/controller/student_controller.dart';
import 'package:sakib_school/pages/Teachers/Section/controller/SectionController.dart';

import '../../Classes/controller/ClassesController.dart';
import 'package:http/http.dart' as http;

class SingleAttendancePage extends StatefulWidget {
  const SingleAttendancePage({super.key});

  @override
  State<SingleAttendancePage> createState() => _SingleAttendancePageState();
}

class _SingleAttendancePageState extends State<SingleAttendancePage> {

  var stdCon = Get.put(StudentController());
  var classId;
  var sectionId;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    var conCls = Get.put(ClassesController());
    print(stdCon.sendAttendance.length);
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
            status == true
                ? Container(
                    height: 500.h,
                    child: GetBuilder<StudentController>(builder: (context) {
                      return ListView.builder(
                          itemCount: stdCon.students.length,
                          itemBuilder: (context, index) {
                            var satus = stdCon.students[index].attendance;
                            return ListTile(
                              title: Text(
                                stdCon.students[index].userName.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: Switch(
                                  value: stdCon.sendAttendance[index]['status'],
                                  onChanged: (value) {
                                    for (int i = 0;
                                        i <= stdCon.sendAttendance.length;
                                        i++) {
                                      if (stdCon.sendAttendance[i]
                                                  ['student_id'] ==
                                              stdCon.sendAttendance[index]
                                                  ['student_id'] &&
                                          stdCon.sendAttendance[index]
                                              ['status']) {
                                        setState(() {
                                          stdCon.sendAttendance[index]
                                              ['status'] = false;
                                        });
                                      } else if (stdCon.sendAttendance[i]
                                                  ['student_id'] ==
                                              stdCon.sendAttendance[index]
                                                  ['student_id'] &&
                                          stdCon.sendAttendance[index]
                                                  ['status'] ==
                                              false) {
                                        setState(() {
                                          stdCon.sendAttendance[index]
                                              ['status'] = true;
                                        });
                                      }
                                      //print(mobile);
                                    }
                                  }),
                            );
                          });
                    }),
                  )
                : Center(
                    child: Text(
                      "Select Date, Class and Section",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
            InkWell(
              onTap: () {
                //  print(stdCon.sendAttendance);
                saveAttendance();
              },
              child: Container(
                alignment: Alignment.center,
                width: 150.w,
                height: 40.h,
                decoration: BoxDecoration(color: baseColor),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  final _box = GetStorage();
  var client = http.Client();
  bool isLoading = false;
  saveAttendance() async {
    var token = "79|uYrWRG0rX9odolGNIA5n3POpYCaRTcbBYM8zMO43";
 print(stdCon.sendAttendance); 
    print(classId);
    try {
      print("object");
      var map = {
        "date": "25-05-2023",
        "class_id": "1",
        "section_id": "1",
        "attendance": "${stdCon.sendAttendance}"
      };
      var finalData = jsonEncode(map);

      var response = await client.post(
          Uri.parse("https://edufiy.alivedevs.cf/api/single-attendance-store/1"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
          body: map);
      print(response.body);
      if (response.statusCode == 201) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);

        print(jsonData);
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
