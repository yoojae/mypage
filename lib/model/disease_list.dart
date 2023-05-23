import 'disease.dart';

class DiseaseList {
  List<Disease>? data;
  bool? success;
  int? status;
  String? message;

  DiseaseList({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory DiseaseList.fromJson(Map<String, dynamic> json) => DiseaseList(
      success: json["success"],
      status: json["status"],
      message: json["message"],
      data: List<Disease>.from(
          json["data"].map((data) => Disease.fromJson(data))));
}
