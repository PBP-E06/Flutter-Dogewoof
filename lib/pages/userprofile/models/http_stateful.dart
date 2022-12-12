// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.data,
    });

    Data data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };

    
}

class Data {
    Data({
        required this.username,
        required this.bio,
        required this.image,
        required this.address,
        required this.dogtype,
        required this.saldo,
        required this.phone,
        required this.email,
    });

    String username;
    String bio;
    String image;
    String address;
    String dogtype;
    int saldo;
    String phone;
    String email;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        bio: json["bio"],
        image: json["image"],
        address: json["address"],
        dogtype: json["dogtype"],
        saldo: json["saldo"],
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "bio": bio,
        "image": image,
        "address": address,
        "dogtype": dogtype,
        "saldo": saldo,
        "phone": phone,
        "email": email,
    };
}
