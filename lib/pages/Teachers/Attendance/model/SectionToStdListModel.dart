// To parse this JSON data, do
//
//     final sectionToStdListModel = sectionToStdListModelFromJson(jsonString);

import 'dart:convert';

SectionToStdListModel sectionToStdListModelFromJson(String str) => SectionToStdListModel.fromJson(json.decode(str));



class SectionToStdListModel {
    List<StudentListModel>? data;
    String? message;

    SectionToStdListModel({
        this.data,
        this.message,
    });

    factory SectionToStdListModel.fromJson(Map<String, dynamic> json) => SectionToStdListModel(
        data: List<StudentListModel>.from(json["data"].map((x) => StudentListModel.fromJson(x))),
        message: json["message"],
    );

}

class StudentListModel {
    int? id;
    String? name;
    String? lastName;
    String? phone;
    Classes? className;
    Sections? sectionName;

    StudentListModel({
        this.id,
        this.name,
        this.lastName,
        this.phone,
        this.className,
        this.sectionName,
    });

    factory StudentListModel.fromJson(Map<String, dynamic> json) => StudentListModel(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        phone: json["phone"],
        className: Classes.fromJson(json["class"]),
        sectionName: Sections.fromJson(json["section"]),
    );

   
}

class Classes {
    int? id;
    String? name;

    Classes({
        this.id,
        this.name,
    });

    factory Classes.fromJson(Map<String, dynamic> json) => Classes(
        id: json["id"],
        name: json["name"],
    );


}

class Sections {
    int? id;
    String? name;

    Sections({
        this.id,
        this.name,
    });

    factory Sections.fromJson(Map<String, dynamic> json) => Sections(
        id: json["id"],
        name: json["name"],
    );

   
}
