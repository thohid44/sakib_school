import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakib_school/Utils/colors.dart';
import 'package:sakib_school/pages/Teachers/Profile/controller/teacher_profile_controller.dart';

class TeacherProfile extends GetView<TeacherProfileController> {
 
 var controller = Get.put(TeacherProfileController());
  @override
  Widget build(BuildContext context) {
    controller.getProfile();
   
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: baseColor
        ,
      ),
      // body: Obx(() =>  ListView(
      //     children: [
         
         body:    Column(
       
           children: [
             Center(
               child: Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.only(left: 20.w, top: 20.h),
                              height: 300.h,
                              width: 300.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Name:",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Container(
                                        child: Text(
                                          "Md. Thohidul Islam",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "E-mail:",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Container(
                                        child: Text(
                                          "thohid@gmail.com",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Phone:",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Container(
                                        child: Text(
                                          "01822906390",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "User Type:",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Container(
                                        child: Text(
                                           "Teacher",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 70.h,
                                  ),
                                
                                ],
                              ),
                            ),
                          ),
             ),
           ],
         ),
          
      
      
    );
  }
}