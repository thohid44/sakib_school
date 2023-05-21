// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

SectionsModel sectionModelFromJson(String str) => SectionsModel.fromJson(json.decode(str));


class SectionsModel {
    List<Sections>? data;
    String? message;

    SectionsModel({
        this.data,
        this.message,
    });

    factory SectionsModel.fromJson(Map<String, dynamic> json) => SectionsModel(
        data: List<Sections>.from(json["data"].map((x) => Sections.fromJson(x))),
        message: json["message"],
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
