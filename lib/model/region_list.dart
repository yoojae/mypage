import 'package:orot/model/region.dart';

class RegionList {
  List<Region>? data;
  bool? success;
  int? status;
  String? message;

  RegionList({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory RegionList.fromJson(Map<String, dynamic> json) =>
      RegionList(
          success: json["success"],
          status: json["status"],
          message: json["message"],
          data: List<Region>.from(
              json["data"].map((data) => Region.fromJson(data))));
}