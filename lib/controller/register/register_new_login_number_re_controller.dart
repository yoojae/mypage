import 'dart:math';

import 'package:get/get.dart';

import '../../global_asset/common.dart';
import '../../model/member.dart';

class ResisterNewLoginNumberReController extends GetxController {
  static ResisterNewLoginNumberReController get to => Get.find();

  RxList<int> numberList = <int>[].obs;

  RxString passwordValue = "".obs;

  RxString rePasswordValue = "".obs;

  Member? member;

  @override
  void onInit() {
    super.onInit();
    makeRandomList();
    getArgument();
  }

  void getArgument() {
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      }
    }

    member ??= Member();
  }

  makeRandomList() {
    while (true) {
      // 랜덤으로 번호를 생성해준다.
      var rnd = Random().nextInt(10) + 1;

      // 만약 리스트에 생성된 번호가 없다면
      if (!numberList.contains(rnd)) {
        // 리스트에 추가해준다.
        numberList.add(rnd);
      }

      // 리스트의 길이가 6이면 while문을 종료한다.
      if (numberList.length == 10) break;
    }

    //10을 0으로 변경
    for (var i = 0; i < numberList.length; i++) {
      if (numberList[i] == 10) {
        numberList[i] = 0;
      }
    }
  }

  setPassword(String val) {
    if (passwordValue.value.length < 4) {
      passwordValue(passwordValue.value + val);
    }

    if (passwordValue.value.length == 4) {
      if (member?.securityNumber != passwordValue.value) {
        //비밀번호 설정이 틀렸습니다.
        Common.showToast("비밀번호 설정이 틀렸습니다.");
      } else {
        toNext();
      }
    }
  }

  setDelPassword() {
    if (passwordValue.value.isNotEmpty) {
      passwordValue(
          passwordValue.value.substring(0, passwordValue.value.length - 1));
    }
  }

  void toNext() {
    //다음 페이지
    Get.toNamed("/RegisterLockUse", arguments: {"member": member});
  }
}
