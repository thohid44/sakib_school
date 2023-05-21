
import 'dart:convert';

ClassModel classModelFromJson(String str) => ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
    List<Classes>? data;
    String? message;

    ClassModel({
        this.data,
        this.message,
    });

    factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        data: List<Classes>.from(json["data"].map((x) => Classes.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
