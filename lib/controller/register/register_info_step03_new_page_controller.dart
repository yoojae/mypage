import 'package:get/get.dart';
import 'package:orot/model/member.dart';
import 'package:orot/model/unborn.dart';

class ResisterInfoStep03NewPageController extends GetxController {
  static ResisterInfoStep03NewPageController get to => Get.find();

  //회원정보
  Member? member;

  RxInt babyCount = 0.obs;
  RxBool isCanNextButton = false.obs;

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
    List<Unborn> unborns = [];
    for (var i = 0; i < babyCount.value; i++) {
      unborns.add(Unborn());
    }
    member?.unborns = unborns;

    //다음 페이지
    Get.toNamed("/ResisterInfoStep04Page", arguments: {"member": member});
  }
}
