import 'package:get/get.dart';
import 'package:orot/controller/global_asset/address_select_controller.dart';
import 'package:orot/model/member.dart';

class ResisterInfoStep01NewPageController extends GetxController {
  static ResisterInfoStep01NewPageController get to => Get.find();

  //회원정보
  Member? member;

  //상태 변수
  RxBool isGWorker = false.obs;
  RxBool isGNotWorker = false.obs;
  RxBool isCanNextButton = false.obs;

  RxString selectedArea = "지역을 선택하세요".obs;

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<AddressSelectController>()) {
      Get.put(AddressSelectController());
    }

    getArgument();
  }

  void getArgument() {
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      } else {
        member = Member();
      }
    }
    member ??= Member();
  }

  void setWorker(bool isWorker) {
    isGWorker(isWorker);
    isGNotWorker(false);
    member?.isWork = isWorker;
    isCanNext();
  }

  void setNoneWorker(bool isNoneWorker) {
    isGWorker(false);
    isGNotWorker(isNoneWorker);
    member?.isWork = false;
    isCanNext();
  }

  //주소 세팅
  void setAddress(String address) {
    member?.address = address;
    selectedArea(address);
    isCanNext();
  }

  void isCanNext() {
    if (member == null) {
      isCanNextButton(false);
      return;
    }

    if (member!.address == null) {
      isCanNextButton(false);
      return;
    }

    if (member!.address!.isEmpty) {
      isCanNextButton(false);
      return;
    }

    if (!isGWorker.value && !isGNotWorker.value) {
      isCanNextButton(false);
      return;
    }

    isCanNextButton(true);
  }

  void toNext() {
    //다음 페이지(주소지 입력)
    Get.toNamed("/ResisterInfoStep02Page", arguments: {"member": member});
  }
}
