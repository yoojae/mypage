class Region {
  String? city;
  String? district;

  Region({
    this.city,
    this.district});

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    city: json["city"],
    district: json["district"]
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "district": district
  };
}