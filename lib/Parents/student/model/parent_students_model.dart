// To parse this JSON data, do
//
//     final parentStudentsModel = parentStudentsModelFromJson(jsonString);

import 'dart:convert';

ParentStudentsModel parentStudentsModelFromJson(String str) => ParentStudentsModel.fromJson(json.decode(str));

String parentStudentsModelToJson(ParentStudentsModel data) => json.encode(data.toJson());

class ParentStudentsModel {
    List<Datum>? data;
  

    ParentStudentsModel({
        this.data,
      
    });

    factory ParentStudentsModel.fromJson(Map<String, dynamic> json) => ParentStudentsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
       
    };
}

class Datum {
    int? id;
    String? name;
    String? lastName;
    String? phone;
    ClassName? datumClass;
    Section? section;

    Datum({
        this.id,
        this.name,
        this.lastName,
        this.phone,
        this.datumClass,
        this.section,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        phone: json["phone"],
        datumClass: ClassName.fromJson(json["class"]),
        section: Section.fromJson(json["section"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "phone": phone,
        "class": datumClass!.toJson(),
        "section": section!.toJson(),
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
       
    };
}
