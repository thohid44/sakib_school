import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakib_school/Parents/student/controller/parent_stds_controller.dart';


class ParentStudentsPage extends StatefulWidget {
  const ParentStudentsPage({super.key});

  @override
  State<ParentStudentsPage> createState() => _ParentStudentsPageState();
}

class _ParentStudentsPageState extends State<ParentStudentsPage> {
  var controller = Get.put(ParentStdsController()); 
  @override
  Widget build(BuildContext context) {
    controller.getParentStds(); 
    controller.stdList; 
    print(controller.stdList.length); 
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Students List"),),

      body:  GetBuilder<ParentStdsController>(builder: (context){
        return ListView.builder(
          itemCount: controller.stdList.length,
          itemBuilder:(context,index){
          return Container(
             margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
             padding: EdgeInsets.all(8.0.w),
            alignment: Alignment.center,
            width: 300.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Student Name:${controller.stdList[index].name.toString()}", 
                      style: TextStyle(fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                       Container(
                      child: Text("Roll:${controller.stdList[index].id.toString()}", 
                      style: TextStyle(fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                        Container(
                      child: Text("Phone:${controller.stdList[index].phone.toString()}", 
                      style: TextStyle(fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                       
                  ],
                )),
                Container(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Class:${controller.stdList[index].datumClass!.name.toString()}", 
                      style: TextStyle(fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                       Container(
                      child: Text("Secion :${controller.stdList[index].section!.name.toString()}", 
                      style: TextStyle(fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                    
                       
                  ],
                )),
              ],
            ),
          ); 
        });
      })
      ),
    ); 
  }
}