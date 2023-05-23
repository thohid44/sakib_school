// To parse this JSON data, do
//
//     final teacherProfile = teacherProfileFromJson(jsonString);

import 'dart:convert';

TeacherProfileModel teacherProfileFromJson(String str) => TeacherProfileModel.fromJson(json.decode(str));



class TeacherProfileModel {
    Profile? data;
    String? message;

    TeacherProfileModel({
        this.data,
        this.message,
    });

    factory TeacherProfileModel.fromJson(Map<String, dynamic> json) => TeacherProfileModel(
        data: Profile.fromJson(json["data"]),
        message: json["message"],
    );

}

class Profile {
    int? id;
    String? name;
    String? email;
    String? lastName;
    String? phone;

    Profile({
        this.id,
        this.name,
        this.email,
        this.lastName,
        this.phone,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        lastName: json["last_name"],
        phone: json["phone"],
    );

  
}
