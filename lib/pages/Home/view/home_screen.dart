import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakib_school/Widget/custom_Appbar.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),

          body: Column(
            children: [
              SizedBox(height: 10.h,), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100.h, 
                    width: 100.w, 
                    decoration: BoxDecoration(
                      color: Colors.white, 
                     borderRadius: BorderRadius.circular(15.r), 
                     boxShadow: [
                      BoxShadow(blurRadius: 2, 
                     
                      )
                     ]
                    ), 
                    child: Text("Attendance"),
                  ),
                   Container(
                       alignment: Alignment.center,
                    height: 100.h, 
                    width: 100.w, 
                    decoration: BoxDecoration(
                      color: Colors.white
                    ), 
                    child: Text("Attendance"),
                  ),
                   Container(
                       alignment: Alignment.center,
                    height: 100.h, 
                    width: 100.w, 
                    decoration: BoxDecoration(
                      color: Colors.white
                    ), 
                    child: Text("Attendance"),
                  )
                ],
              )
            ],
          ),
        ),
               

     
    );
  }
}
