// To parse this JSON data, do
//
//     final studentListModel = studentListModelFromJson(jsonString);

import 'dart:convert';

StudentListModel studentListModelFromJson(String str) => StudentListModel.fromJson(json.decode(str));



class StudentListModel {
    List<StudentsModel>? data;
    String? message;

    StudentListModel({
        this.data,
        this.message,
    });

    factory StudentListModel.fromJson(Map<String, dynamic> json) => StudentListModel(
        data: List<StudentsModel>.from(json["data"].map((x) => StudentsModel.fromJson(x))),
        message: json["message"],
    );

   
}

class StudentsModel {
    int? id;
    String? name;
    String? lastName;
    String? phone;
    ClassName? datumClass;
    Section? section;

    StudentsModel({
        this.id,
        this.name,
        this.lastName,
        this.phone,
        this.datumClass,
        this.section,
    });

    factory StudentsModel.fromJson(Map<String, dynamic> json) => StudentsModel(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        phone: json["phone"],
        datumClass: ClassName.fromJson(json["class"]),
        section: Section.fromJson(json["section"]),
    );

   
}

class ClassName {
    int? id;
    String? name;

    ClassName({
        this.id,
        this.name,
    });

    factory ClassName.fromJson(Map<String, dynamic> json) => ClassName(
        id: json["id"],
        name: json["name"],
    );


}
class Section {
    int? id;
    String? name;

    Section({
        this.id,
        this.name,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
    );


}
