

import 'dart:convert';

ParentsProfile parentsProfileFromJson(String str) => ParentsProfile.fromJson(json.decode(str));

String parentsProfileToJson(ParentsProfile data) => json.encode(data.toJson());

class ParentsProfile {
    Data? data;
    String? message;

    ParentsProfile({
        this.data,
        this.message,
    });

    factory ParentsProfile.fromJson(Map<String, dynamic> json) => ParentsProfile(
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
    String? email;
    String? lastName;
    String? phone;

    Data({
        this.id,
        this.name,
        this.email,
        this.lastName,
        this.phone,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        lastName: json["last_name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "last_name": lastName,
        "phone": phone,
    };
}
