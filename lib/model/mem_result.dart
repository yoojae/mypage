class MemResult {
  int? status;
  bool? success;
  String? message;
  ResultData? data;

  MemResult({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory MemResult.fromJson(Map<String, dynamic> json) => MemResult(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ResultData.fromJson(json["data"]),
      );
}

class ResultData {
  String? authToken;
  String? uuid;

  ResultData({this.authToken, this.uuid});

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
        authToken: json["auth_token"],
        uuid: json["uuid"],
      );
}
