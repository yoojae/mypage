import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:orot/model/hospital_list.dart';
import 'package:orot/repository/hospital_repository.dart';

import '../../global_asset/common.dart';
import '../comm/common_controller.dart';

class NearbyHospitalController extends GetxController {
  static NearbyHospitalController get to => Get.find();

  late NLatLng latLng;

  String currentAddress = "";
  RxBool isLoading = false.obs;
  HospitalList? hospitalList;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getArgument();
    getNearHospitalList();
  }

  void getArgument() async {
    isLoading(true);
    if (!Get.isRegistered<CommonController>()) {
      Get.put(CommonController());
    }

    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("NLatLng")) {
        latLng = Get.arguments["NLatLng"];

        //현재 주소
        currentAddress = await CommonController.to
            .fetchShortData(latLng.latitude, latLng.longitude);
      }
    }

    isLoading(false);
  }

  Future<HospitalList?> getNearHospitalList() async {
    if (!Get.isRegistered<HospitalRepository>()) {
      Get.put(HospitalRepository());
    }

    hospitalList = await HospitalRepository.to
        .getNearHospitalList(latLng.latitude, latLng.longitude);

    return hospitalList;
  }
}
