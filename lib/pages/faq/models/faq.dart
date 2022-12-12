class FAQ {
  FAQ({
    required this.question,
  });

  String question = "";

  factory FAQ.fromJson(Map<String, dynamic> json) => FAQ (
    question: json["fields"]["question"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
  };
}