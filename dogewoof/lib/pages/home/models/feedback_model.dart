import 'dart:convert';

List<FeedbackModel> welcomeFromJson(String str) => List<FeedbackModel>.from(json.decode(str).map((x) => FeedbackModel.fromJson(x)));

String welcomeToJson(List<FeedbackModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedbackModel {
    FeedbackModel({
        required this.username,
        required this.date,
        required this.subject,
        required this.description,
    });

    String username;
    String date;
    String subject;
    String description;

    factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        username: json["username"],
        date: json["date"],
        subject: json["subject"],
        description: json["description"]
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "date": date,
        "subject": subject,
        "description": description,
    };
}