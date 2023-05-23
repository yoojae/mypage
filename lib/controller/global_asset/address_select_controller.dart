import 'package:get/get.dart';
import 'package:orot/model/region.dart';
import 'package:orot/model/region_list.dart';
import 'package:orot/repository/common_repository.dart';

class AddressSelectController extends GetxController {
  static AddressSelectController get to => Get.find();

  RxSet<String> city = <String>{}.obs;
  RxSet<String> district = <String>{}.obs;
  RxString selectedCity = "".obs;
  RxString selectedDistrict = "".obs;
  RegionList? listData;

  @override
  void onInit() {
    super.onInit();
    getInitData();
  }

  //도시 가져오기
  Future<void> getInitData() async {
    if (!Get.isRegistered<CommmonRepository>()) {
      Get.put(CommmonRepository());
    }

    listData = await CommmonRepository.to.getRegionList();

    if (listData?.data != null) {
      for (Region region in listData!.data!) {
        city.add(region.city!);
      }

      if (city.isNotEmpty && selectedCity.value.isEmpty) {
        selectedCity(city.first);
        getCityData(selectedCity.value);
      }
    }
  }

  //구 가져오기
  void getCityData(String cityName) {
    if (selectedCity.value.isNotEmpty) {
      if (listData?.data != null) {
        district.clear();
        for (Region region in listData!.data!) {
          if (region.city == selectedCity.value && region.district != null) {
            district.add(region.district!);
          }
        }

        district.refresh();
      }
    }
  }
}
