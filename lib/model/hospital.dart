class Hospital {
  int? id;
  String? name;
  String? address;
  int? gynecologistCount;
  String? number;
  String? type;
  num? distance;

  Hospital(
      {this.id,
      this.name,
      this.address,
      this.gynecologistCount,
      this.number,
      this.type,
      this.distance});

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        gynecologistCount: json["gynecologist_count"],
        number: json["number"],
        type: json["type"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "gynecologist_count": gynecologistCount,
        "number": number,
        "type": type,
        "distance": distance,
      };
}
/**
 * 
 * "id": 59,
            "name": "의료법인성광의료재단일산차병원",
            "address": "경기 고양시 일산동구 중앙로 1205 일산차병원",
            "gynecologist_count": 0,
            "number": "031-782-8300",
            "type": "secondary",
            "distance": 1.45164877453549
 */