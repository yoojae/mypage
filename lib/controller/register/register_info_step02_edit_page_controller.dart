import 'package:get/get.dart';
import 'package:orot/model/member.dart';

class ResisterInfoStep02EditPageController extends GetxController {
  static ResisterInfoStep02EditPageController get to => Get.find();

  //회원정보
  Member? member;
  Member? orgMember;
  String? toPage;
  //Step02
  RxBool isGPrimipara = false.obs;
  RxBool isGNotPrimipara = false.obs;
  RxBool isCanNextButton = false.obs;
  RxBool isMiscarriageYes = false.obs;
  RxBool isMiscarriageNo = false.obs;

  @override
  void onInit() {
    super.onInit();
    getArgument();
  }

  void getArgument() {
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      } else {
        member = Member();
      }
      if ((Get.arguments as Map).containsKey("orgMember")) {
        orgMember = Get.arguments["orgMember"];
      }
      if ((Get.arguments as Map).containsKey("toPage")) {
        toPage = Get.arguments["toPage"];
      }
    }
    member ??= Member();
  }

  //초산여부선택
  void setPrimipara(bool isPrimipara) {
    isGPrimipara(isPrimipara);
    isGNotPrimipara(false);
    isMiscarriageYes(false);
    isMiscarriageNo(false);
    isCanNext();
  }

  void setNonePrimipara(bool isNonePrimipara) {
    isGPrimipara(false);
    isGNotPrimipara(isNonePrimipara);
    isCanNext();
  }

  void setMiscarriageYes(bool isMiscarriageYes) {
    isMiscarriageNo(false);
    this.isMiscarriageYes(!isMiscarriageYes);
    isCanNext();
  }

  void setMiscarriageNo(bool isMiscarriageNo) {
    this.isMiscarriageNo(!isMiscarriageNo);
    isMiscarriageYes(false);
    isCanNext();
  }

  //버튼 2개 여부 확인
  void isCanNext() {
    if (isGPrimipara.value || isGNotPrimipara.value) {
      if (isGNotPrimipara.value) {
        if (isMiscarriageYes.value || isMiscarriageNo.value) {
          isCanNextButton(true);
        } else {
          isCanNextButton(false);
        }
      } else {
        isCanNextButton(true);
      }
      member?.deliver = isGPrimipara.value ? "primipara" : "multipara";
      member?.isMiscarriage = isMiscarriageYes.value;
    } else {
      isCanNextButton(false);
    }
  }

  void toNext() {
    if (toPage != null && toPage!.isNotEmpty) {
      Get.toNamed(toPage!, arguments: {"member": member});
    } else {
      //다음 페이지(주소지 입력)
      Get.toNamed("/ResisterInfoAllEditPage",
          arguments: {"member": member, "orgMember": orgMember});
    }
  }
}
