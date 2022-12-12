// To parse this JSON data, do
//
//     final artikel = artikelFromJson(jsonString);

import 'dart:convert';

// Artikel artikelFromJson(String str) => Artikel.fromJson(json.decode(str));

// String artikelToJson(Artikel data) => json.encode(data.toJson());

class Artikel {
    int id;
    String image;
    String name;
    String firstDescription;
    String secontDescription;
    Funfact funfact;

    Artikel({
        required this.id,
        required this.image,
        required this.name,
        required this.firstDescription,
        required this.secontDescription,
        required this.funfact,
    });

    // factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
    //     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    // );

    // Map<String, dynamic> toJson() => {
    //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
    // };
}

// class Datum {
//     Datum({
//         required this.id,
//         required this.image,
//         required this.name,
//         required this.firstDescription,
//         required this.secontDescription,
//         required this.funfact,
//     });

//     int id;
//     String image;
//     String name;
//     String firstDescription;
//     String secontDescription;
//     Funfact funfact;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         image: json["image"],
//         name: json["name"],
//         firstDescription: json["first_description"],
//         secontDescription: json["secont_description"],
//         funfact: Funfact.fromJson(json["funfact"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "name": name,
//         "first_description": firstDescription,
//         "secont_description": secontDescription,
//         "funfact": funfact.toJson(),
//     };
// }

class Funfact {
    Funfact({
        required this.tinggi,
        required this.berat,
        required this.masaHidup,
        required this.namaIlmiah,

    });

    String tinggi;
    String berat;
    String masaHidup;
    String namaIlmiah;

    factory Funfact.fromJson(Map<String, dynamic> json) => Funfact(
        tinggi: json["tinggi"],
        berat: json["berat"],
        masaHidup: json["masa hidup"],
        namaIlmiah: json["nama ilmiah"],
    );

    Map<String, dynamic> toJson() => {
        "tinggi": tinggi,
        "berat": berat,
        "masa hidup": masaHidup,
        "nama ilmiah": namaIlmiah,
    };
}

