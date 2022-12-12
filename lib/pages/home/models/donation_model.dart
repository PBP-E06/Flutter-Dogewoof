import 'dart:convert';

List<Donation> welcomeFromJson(String str) => List<Donation>.from(json.decode(str).map((x) => Donation.fromJson(x)));

String welcomeToJson(List<Donation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Donation {
    Donation({
        required this.username,
        required this.amount,
    });

    String username;
    int amount;

    factory Donation.fromJson(Map<String, dynamic> json) => Donation(
        username: json["username"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "amount": amount,
    };
}