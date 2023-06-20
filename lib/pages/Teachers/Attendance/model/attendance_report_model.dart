// To parse this JSON data, do
//
//     final attendanceReportModel = attendanceReportModelFromJson(jsonString);

import 'dart:convert';

AttendanceReportModel attendanceReportModelFromJson(String str) => AttendanceReportModel.fromJson(json.decode(str));


class AttendanceReportModel {
    List< AttendanReportModel>? data;
    String? message;

    AttendanceReportModel({
        this.data,
        this.message,
    });

    factory AttendanceReportModel.fromJson(Map<String, dynamic> json) => AttendanceReportModel(
        data: List<AttendanReportModel>.from(json["data"].map((x) => AttendanReportModel.fromJson(x))),
        message: json["message"],
    );

   
}

class AttendanReportModel {
    int? id;
    String? date;
    int? attendance;
    String? userName;
    String? datumClass;
    String? section;

    AttendanReportModel({
        this.id,
        this.date,
        this.attendance,
        this.userName,
        this.datumClass,
        this.section,
    });

    factory AttendanReportModel.fromJson(Map<String, dynamic> json) => AttendanReportModel(
        id: json["id"],
        date: json["date"],
        attendance: json["attendance"],
        userName: json["user_name"],
        datumClass: json["class"],
        section: json["section"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "attendance": attendance,
        "user_name": userName,
        "class": datumClass,
        "section": section,
    };
}
