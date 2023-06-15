// // To parse this JSON data, do
// //
// //     final studentModel = studentModelFromJson(jsonString);

// import 'dart:convert';

// StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));


// class StudentModel {
//     List<Students>? data;
//     String? message;

//     StudentModel({
//         this.data,
//         this.message,
//     });

//     factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
//         data: List<Students>.from(json["data"].map((x) => Students.fromJson(x))),
//         message: json["message"],
//     );


// }

// class Students {
//     int? id;
//     String? date;
//     int? attendance;
//     String? userName;
//     String? datumClass;
//     String? section;

//     Students({
//         this.id,
//         this.date,
//         this.attendance,
//         this.userName,
//         this.datumClass,
//         this.section,
//     });

//     factory Students.fromJson(Map<String, dynamic> json) => Students(
//         id: json["id"],
//         date: json["date"],
//         attendance: json["attendance"],
//         userName: json["user_name"],
//         datumClass: json["class"],
//         section: json["section"],
//     );

 
// }
