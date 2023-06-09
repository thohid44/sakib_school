import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakib_school/Utils/colors.dart';
import 'package:sakib_school/Utils/localstorekey.dart';
import 'package:sakib_school/pages/Teachers/Attendance/controller/student_controller.dart';
import 'package:sakib_school/pages/Teachers/Section/controller/SectionController.dart';
import '../../Classes/controller/ClassesController.dart';
import 'package:http/http.dart' as http;

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  var stdCon = Get.put(StudentController());
  var sec = Get.put(SectionController());
  var classId;
  var sectionId;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    var conCls = Get.put(ClassesController());

    
     conCls.fetchClass();
 
   
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
                            print("class Id $classId");

                            if (classId != null) {
                              setState(() {
                                   sec.getSection(classId);
                                status = true;
                              });
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
                          items: sec.sections
                              .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(
                                      "${e.name.toString()}",
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            sectionId = value;
                            if (sectionId !=null) {
                              setState(() {
                                status = true;
                                stdCon.getStudent(clsId: classId, sectionId: sectionId); 
                              });

                            }
                          });
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,), 
            InkWell( 
              
              onTap: () {
                 datePicker(context);
                },
              child: Container(
                  width: 200.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w)
                  ),
                  child: dateStatus==false? Text(
              "${deliveryDate.day}-${deliveryDate.month}-${deliveryDate.year}",
              style:  TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ):Text("${pickDate.day}-${pickDate.month}-${pickDate.year}",style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),),),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 450.h,
              child: GetBuilder<StudentController>(builder: (context) {
                return ListView.builder(
                    itemCount: stdCon.studentModel.length,
                    itemBuilder: (context, index) {
                      var satus = stdCon.studentModel[index];
                      return ListTile(
                        title: Text(
                          stdCon.studentModel[index].name.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Switch(
                            value: stdCon.sendAttendance[index]['status'],
                            onChanged: (value) {
                              for (int i = 0;
                                  i <= stdCon.sendAttendance.length;
                                  i++) {
                                if (stdCon.sendAttendance[i]['student_id']
                                            .toString() ==
                                        stdCon.sendAttendance[index]
                                                ['student_id']
                                            .toString() &&
                                    stdCon.sendAttendance[index]['status']) {
                                  setState(() {
                                    stdCon.sendAttendance[index]['status'] =
                                        false;
                                  });
                                } else if (stdCon.sendAttendance[i]
                                                ['student_id']
                                            .toString() ==
                                        stdCon.sendAttendance[index]
                                                ['student_id']
                                            .toString() &&
                                    stdCon.sendAttendance[index]['status'] ==
                                        false) {
                                  setState(() {
                                    stdCon.sendAttendance[index]['status'] =
                                        true;
                                  });
                                }
                                //print(mobile);
                              }
                            }),
                      );
                    });
              }),
            ),
            // : Center(
            //     child: Text(
            //       "Select Date, Class and Section",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 20.sp,
            //       ),
            //     ),
            //   ),
            InkWell(
              onTap: () {
                //  print(stdCon.sendAttendance);
                sendAttendance();
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

  sendAttendance() async {
    var token = _box.read(LocalStoreKey.token);
    print("token $token");
    var postUri =
        Uri.parse("https://edufiy.alivedevs.cf/api/teacher/attendance-store");

    Map<String, dynamic> map = {
      "date": dateDairy,
      "class_id": classId,
      "section_id": sectionId,
      "attendances": stdCon.sendAttendance
    };
    var finalmap = jsonEncode(map); 

    try {
      print(finalmap); 
      print("try");
      var request = await http.post(postUri, body: finalmap, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token,
      });
      print("map ${request.body}");

      if (request.statusCode == 201) {
        Get.snackbar(
          "Attendance",
          "Successfully Save",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.purple,
        );
      } else {}
    } catch (e) {
      print(e);
    }
  }

     DateTime pickDate = DateTime.now();
 DateTime deliveryDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  var dateDairy;
bool dateStatus = false; 
datePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: pickDate,
     //  firstDate: DateTime(2021),
    firstDate: DateTime.now(),
      // firstDate: DateTime(2022, 9, 15),

      // lastDate: DateTime(3000),

      lastDate: DateTime(2030, 01, 01),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
         dateStatus = true; 
        pickDate = userSelectedDate;
      print(pickDate); 
        dateDairy =
            "${pickDate.year}-${pickDate.month}-${pickDate.day}";
        print("Date $dateDairy");
      });
    }
  }

}
