import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:orot/model/disease_list.dart';

import '../global_asset/common.dart';
import '../model/region_list.dart';

class CommmonRepository extends GetConnect {
  static CommmonRepository get to => Get.find();

  late Dio _dio;

  CommmonRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        connectTimeout: const Duration(seconds: 1),
      ),
    );
  }

  //지역 조회
  Future<RegionList> getRegionList() async {
    var response = await _dio.get('/region');
    return RegionList.fromJson(response.data);
  }

  Future<DiseaseList> getDiseaseList() async {
    var response = await _dio.get('/disease');
    return DiseaseList.fromJson(response.data);
  }
}
