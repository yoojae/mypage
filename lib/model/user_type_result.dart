import 'package:orot/model/user_type_data.dart';

class UserTypeResult {
  int? status;
  bool? success;
  String? message;
  UserTypeData? data;

  UserTypeResult({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory UserTypeResult.fromJson(Map<String, dynamic> json) => UserTypeResult(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : UserTypeData.fromJson(json["data"]),
      );
}
