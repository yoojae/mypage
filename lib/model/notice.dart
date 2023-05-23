import 'dart:convert';

class Notice {
  int? id;
  String? title;
  String? createdAt;

  Notice({
    this.id,
    this.title,
    this.createdAt,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"],
        title: json["title"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt,
      };
}
