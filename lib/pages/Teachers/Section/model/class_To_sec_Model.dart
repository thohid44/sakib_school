// To parse this JSON data, do
//
//     final clsToSecModel = clsToSecModelFromJson(jsonString);

import 'dart:convert';

ClsToSecModel clsToSecModelFromJson(String str) => ClsToSecModel.fromJson(json.decode(str));


class ClsToSecModel {
    Data? data;
    String? message;

    ClsToSecModel({
        this.data,
        this.message,
    });

    factory ClsToSecModel.fromJson(Map<String, dynamic> json) => ClsToSecModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

   
}

class Data {
    int? id;
    String? name;
    List<Section>? section;

    Data({
        this.id,
        this.name,
        this.section,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        section: List<Section>.from(json["section"].map((x) => Section.fromJson(x))),
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
