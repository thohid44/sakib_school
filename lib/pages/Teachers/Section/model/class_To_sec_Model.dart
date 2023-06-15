// To parse this JSON data, do
//
//     final classToSectionModel = classToSectionModelFromJson(jsonString);

import 'dart:convert';

ClassToSectionModel classToSectionModelFromJson(String str) => ClassToSectionModel.fromJson(json.decode(str));

String classToSectionModelToJson(ClassToSectionModel data) => json.encode(data.toJson());

class ClassToSectionModel {
    Data? data;
    String? message;

    ClassToSectionModel({
        this.data,
        this.message,
    });

    factory ClassToSectionModel.fromJson(Map<String, dynamic> json) => ClassToSectionModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "section": List<dynamic>.from(section!.map((x) => x.toJson())),
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
