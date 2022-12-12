import 'dart:convert';

List<DogItem> welcomeFromJson(String str) =>
    List<DogItem>.from(json.decode(str).map((x) => DogItem.fromJson(x)));

String welcomeToJson(List<DogItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DogItem {
  DogItem({
    required this.item_title,
    required this.price,
    required this.breed,
    required this.description,
    required this.user,
  });

  String item_title;
  int price;
  String breed;
  String description;
  String user;

  factory DogItem.fromJson(Map<String, dynamic> json) => DogItem(
        item_title: json["item_title"],
        price: json["price"],
        breed: json["breed"],
        description: json["description"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "item_title": item_title,
        "price": price,
      };
}
