import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakib_school/Student/StdHome/view/student_Home.dart';
import 'package:sakib_school/pages/Teachers/Home/view/home_screen.dart';
import 'pages/Login/view/login_screen.dart';



void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  
     await GetStorage.init();
  
  HttpOverrides.global = MyHttpOverrides(); 
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EduFiy',
      
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp, 
           
            // ),
          ),
          home: child,
        );
      },
      child:HomeScreen(),
    );
  }
}
