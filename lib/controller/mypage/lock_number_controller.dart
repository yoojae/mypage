import 'dart:math';

import 'package:get/get.dart';

import '../../global_asset/common.dart';
import '../../model/mem_result.dart';
import '../../model/member.dart';
import '../../repository/member_repository.dart';

class LockNumberController extends GetxController {
  static LockNumberController get to => Get.find();

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

  setPassword(String val) async {
    if (passwordValue.value.length < 4) {
      passwordValue(passwordValue.value + val);
    }

    if (passwordValue.value.length == 4) {
      String savedPassword = await Common.getSavedPassWord();
      if (savedPassword == passwordValue.value) {
        toNext();
      } else {
        Common.showToast("저장된 비밀번호와 다릅니다.");
      }
    }
  }

  setDelPassword() {
    if (passwordValue.value.isNotEmpty) {
      passwordValue(
          passwordValue.value.substring(0, passwordValue.value.length - 1));
    }
  }

  Future<bool> registerMember() async {
    if (!Get.isRegistered<MemberRepository>()) {
      Get.put(MemberRepository());
    }

    if (member != null) {
      MemResult result = await MemberRepository.to.signup(member!);

      if (result.success!) {
        if ((result.data?.authToken ?? "") != "") {
          //리턴값 저장하기
          Common.saveServerReturnMemberData(
              result.data?.authToken ?? "", result.data?.uuid ?? "");
          Common.showToast("회원이 가입되었습니다.");
        } else {
          Common.showToast("회원이 수정되었습니다.");
        }
      } else {
        Common.showToast("회원이 가입&수정이 실패하였습니다.");
        return result.success!;
      }
    }

    return true;
  }

  void toNext() async {
    //회원이 있으면 가입 후 첫 화면
    if (member != null) {
      await registerMember();
    }
    //다음 페이지
    Get.offAllNamed("/WelcometoNew");
  }
}
