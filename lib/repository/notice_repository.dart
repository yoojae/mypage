import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/model/noticeList.dart';
import 'package:orot/model/notice.dart';

class NoticeRepository extends GetConnect {
  static NoticeRepository get to => Get.find();

  late Dio _dio;

  NoticeRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        connectTimeout: const Duration(seconds: 1),
      ),
    );
  }

  Future<NoticeList?> getNoticeList() async {
    NoticeList result = NoticeList();
    try {
      _dio.options.headers["Authorization"] = await Common.getToken();
      var response = await _dio.post('/notice');
      result = NoticeList.fromJson(response.data);
    } on DioError catch (e) {
      result.success = e.response?.data["success"];
      result.status = e.response?.data["status"];
      result.message = e.response?.data["message"];
    }
    return result;
  }
}
