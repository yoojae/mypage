import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:orot/model/hospital_list.dart';

import '../global_asset/common.dart';

class HospitalRepository extends GetConnect {
  static HospitalRepository get to => Get.find();

  late Dio _dio;

  HospitalRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        connectTimeout: const Duration(seconds: 1),
      ),
    );
  }

  Future<HospitalList> getNearHospitalList(
      double latitude, double longitude) async {
    HospitalList result = HospitalList();
    try {
      _dio.options.headers["Authorization"] = await Common.getToken();
      var response = await _dio.post('/hospital/distance',
          data: {"latitude": latitude, "longitude": longitude});
      result = HospitalList.fromJson(response.data);
    } on DioError catch (e) {
      result.success = e.response?.data["success"];
      result.status = e.response?.data["status"];
      result.message = e.response?.data["message"];
    }
    return result;
  }
}
