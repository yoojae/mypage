class UserTypeData {
  String? type;
  String? name;

  UserTypeData({this.type, this.name});

  factory UserTypeData.fromJson(Map<String, dynamic> json) =>
      UserTypeData(type: json["type"], name: json["name"]);

  Map<String, dynamic> toJson() => {"type": type, "name": name};
}
