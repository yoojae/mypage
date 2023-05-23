import 'package:orot/model/member.dart';

class MemberResult {
  int? status;
  bool? success;
  String? message;
  Member? data;

  MemberResult({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory MemberResult.fromJson(Map<String, dynamic> json) => MemberResult(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: Member.fromJson(json["data"]),
      );
}
