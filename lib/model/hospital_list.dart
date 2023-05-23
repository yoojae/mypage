import 'package:orot/model/hospital.dart';

class HospitalList {
  List<Hospital>? data;
  bool? success;
  int? status;
  String? message;

  HospitalList({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory HospitalList.fromJson(Map<String, dynamic> json) => HospitalList(
      success: json["success"],
      status: json["status"],
      message: json["message"],
      data: List<Hospital>.from(
          json["data"].map((data) => Hospital.fromJson(data))));
}
