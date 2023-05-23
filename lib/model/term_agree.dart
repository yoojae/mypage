class TermAgree {
  int? id;
  int? isAgree;

  TermAgree({this.id, this.isAgree});

  factory TermAgree.fromJson(Map<String, dynamic> json) => TermAgree(
        id: json['id'],
        isAgree: json['is_agree'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'is_agree': isAgree,
      };
}
