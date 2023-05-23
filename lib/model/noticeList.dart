// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:orot/model/notice.dart';

class NoticeList {
  int? status;
  bool? success;
  String? message;
  List<Notice>? data;

  NoticeList({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory NoticeList.fromJson(Map<String, dynamic> json) => NoticeList(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List.from(json["data"].map((x) => Notice.fromJson(x))),
      );
}
