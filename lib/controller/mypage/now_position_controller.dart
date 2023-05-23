import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../global_asset/common.dart';
import '../comm/common_controller.dart';

class NowPositionController extends GetxController {
  static NowPositionController get to => Get.find();

  RxBool isLoading = false.obs;
  RxBool isInitLoading = false.obs;
  String roadAddrName = "";
  String addrName = "";

  double latitude = 0;
  double longitude = 0;

  late NaverMapController mapController;

  @override
  void onInit() async {
    super.onInit();
    await getCurrentGeolocator();
    await getCurrentAddress();
  }

  Future<void> getCurrentGeolocator() async {
    isInitLoading(true);
    await Common.getRequiredLocationPermmision();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    //현재위치를 position이라는 변수로 저장
    latitude = position.latitude;
    longitude = position.longitude;
    isInitLoading(false);
  }

  Future<void> getCurrentAddress() async {
    isLoading(true);
    await Common.getRequiredLocationPermmision();
    await getAddress(latitude, longitude);
  }

  Future<void> getAddress(double latitude, double longitude) async {
    this.latitude = latitude;
    this.longitude = longitude;

    isLoading(true);
    await Common.getRequiredLocationPermmision();

    //현재위치 다시 마커
    setCurrentMakrer();

    try {
      if (!Get.isRegistered<CommonController>()) {
        Get.put(CommonController());
      }

      List addressList =
          await CommonController.to.fetchData(latitude, longitude);

      if (addressList.isNotEmpty) {
        roadAddrName = addressList[0];
        addrName = addressList[1];
      }
    } catch (e) {
      roadAddrName = "주소 못 가지고옴";
      addrName = "주소 못 가지고옴";
    } finally {
      isLoading(false);
    }
  }

  void onMapReady(NaverMapController controller) {
    mapController = controller;
    setCurrentMakrer();
  }

  void setCurrentMakrer() {
    final currentPositon =
        NMarker(id: '1', position: NLatLng(latitude, longitude));

    mapController
        .deleteOverlay(NOverlayInfo(type: NOverlayType.marker, id: '1'));
    mapController.addOverlay(currentPositon);
  }
}
