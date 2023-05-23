class Disease {
  int? id;
  String? name;
  String? type;
  bool? isSelected = false;

  Disease({
    this.id,
    this.name,
    this.type,
  });

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };

  Map<String, dynamic> toSaveJson() => {
        "id": id,
        "type": type,
      };
}
