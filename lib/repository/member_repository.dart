import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:orot/model/member.dart';
import 'package:orot/model/user_type_result.dart';

import '../global_asset/common.dart';
import '../model/mem_result.dart';
import '../model/member_result.dart';

class MemberRepository extends GetConnect {
  static MemberRepository get to => Get.find();

  late Dio _dio;

  MemberRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        connectTimeout: const Duration(seconds: 1),
      ),
    );
  }

  //회원 가입
  Future<MemResult> signup(Member member) async {
    String authToken = await Common.getToken();
    MemResult result = MemResult();
    if (authToken.isEmpty) {
      //신규가입
      try {
        var response =
            await _dio.post('/user/signup', data: member.toInsertJson());
        result = MemResult.fromJson(response.data);
      } on DioError catch (e) {
        result.success = e.response?.data["success"];
        result.status = e.response?.data["status"];
        result.message = e.response?.data["message"];
      }
    } else {
      //회원 업데이트
      try {
        _dio.options.headers["Authorization"] = await Common.getToken();
        var response = await _dio.put('/user/info', data: member.toSavedJson());
        result = MemResult.fromJson(response.data);
      } on DioError catch (e) {
        result.success = e.response?.data["success"];
        result.status = e.response?.data["status"];
        result.message = e.response?.data["message"];
      }
    }
    return result;
  }

  Future<MemResult> saveAuthData(Member member) async {
    MemResult result = MemResult();
    try {
      _dio.options.headers["Authorization"] = await Common.getToken();
      var response = await _dio.put('/user/identity', data: member.toJson());
      result = MemResult.fromJson(response.data);
    } on DioError catch (e) {
      result.success = e.response?.data["success"];
      result.status = e.response?.data["status"];
      result.message = e.response?.data["message"];
    }

    return result;
  }

  //유저 타입 조회
  Future<UserTypeResult> getMemeberType() async {
    UserTypeResult result = UserTypeResult();
    try {
      _dio.options.headers["Authorization"] = await Common.getToken();
      var response = await _dio.get('/user/profile');
      result = UserTypeResult.fromJson(response.data);
    } on DioError catch (e) {
      result.success = e.response?.data["success"];
      result.status = e.response?.data["status"];
      result.message = e.response?.data["message"];
    }

    return result;
  }

  //회원 가입여부 확인
  Future<MemResult> exists(String residentNumber, String name) async {
    MemResult result = MemResult();
    try {
      var response = await _dio.post('/user/decide',
          data: {"resident_number": residentNumber, "name": name});
      result = MemResult.fromJson(response.data);
    } on DioError catch (e) {
      result.success = e.response?.data["success"];
      result.status = e.response?.data["status"];
      result.message = e.response?.data["message"];
    }
    return result;
  }

  //회원 조회
  Future<Member?> getMember() async {
    MemberResult result = MemberResult();
    try {
      _dio.options.headers["Authorization"] = await Common.getToken();
      var response = await _dio.get('/user/info');
      result = MemberResult.fromJson(response.data);
    } on DioError catch (e) {
      result.success = e.response?.data["success"];
      result.status = e.response?.data["status"];
      result.message = e.response?.data["message"];
      result.data = Member();
    }
    return result.data;
  }
}
