// To parse this JSON data, do
//
//     final suppli = beritaFromJson(jsonString);

import 'dart:convert';

List<Product> suppliesFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String suppliesToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.title,
        required this.price,
        required this.description,
        required this.contact,
    });

    String title;
    String price;
    String description;
    String contact;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        price: json["price"],
        description: json["description"],
        contact: json["contact"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "contact": contact,
    };
}
