import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakib_school/pages/Teachers/Attendance/controller/student_controller.dart';
import 'package:sakib_school/pages/Teachers/Classes/controller/ClassesController.dart';
import 'package:sakib_school/pages/Teachers/Section/controller/SectionController.dart';

class AttendanceReportPage extends StatefulWidget {
  const AttendanceReportPage({super.key});

  @override
  State<AttendanceReportPage> createState() => _AttendanceReportPageState();
}

class _AttendanceReportPageState extends State<AttendanceReportPage> {
    var stdCon = Get.put(StudentController());
  var sec = Get.put(SectionController());
  var conCls = Get.put(ClassesController()); 
  var classId;
  var sectionId;
  bool status = false;
  @override
  Widget build(BuildContext context) {
     conCls.fetchClass();
    return Scaffold(
      appBar: AppBar(), 
      body: Column(
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
                      setState(() {
                              sectionId = value;
                              if (sectionId !=null && classId !=null && dateAttend !=null) {
                           
                                status = true;
                                stdCon.getAttendReport (clsId: classId, sectionId: sectionId, date: dateAttend); 
                            

                            }
                      });
                          
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
           status ==true?  Container(
              height: 450.h,
              child: GetBuilder<StudentController>(builder: (context) {
                return ListView.builder(
                    itemCount: stdCon.attendReports.length,
                    itemBuilder: (context, index) {
                     var sts = stdCon.attendReports[index].attendance;
                      return ListTile(
                        title: Text(
                          stdCon.attendReports[index].userName.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing:sts==0? Text("A"):Text("p")
                      );
                    });
              }),
            ):Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
  
     DateTime pickDate = DateTime.now();
 DateTime deliveryDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  var dateAttend;
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
        dateAttend =
            "${pickDate.day}-${pickDate.month}-${pickDate.year}";
        print("Date $dateAttend");
      });
    }
  }
}