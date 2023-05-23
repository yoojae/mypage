import 'package:get/get.dart';
import 'package:orot/model/member.dart';
import 'package:orot/model/unborn.dart';

class ResisterInfoStep03EditPageController extends GetxController {
  static ResisterInfoStep03EditPageController get to => Get.find();

  //회원정보
  Member? member;
  Member? orgMember;
  RxInt babyCount = 0.obs;
  RxBool isCanNextButton = false.obs;
  String? toPage;

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

  //STEP03
  void setBabyCount(int babyCount) {
    //태아 명수 세팅
    if (babyCount == 1 && this.babyCount.value == 1) {
      this.babyCount(0);
    } else if (babyCount == 2 && this.babyCount.value >= 2) {
      this.babyCount(0);
    } else {
      this.babyCount(babyCount);
    }

    if (this.babyCount.value > 0) {
      isCanNextButton(true);
    } else {
      isCanNextButton(false);
    }
  }

  //다태아 (-) 버튼
  void minusBabyCount() {
    if (babyCount.value > 2) {
      babyCount(babyCount.value - 1);
    }
  }

  //다태아 (+) 버튼
  void plusBabyCount() {
    if (babyCount.value < 6) {
      babyCount(babyCount.value + 1);
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
