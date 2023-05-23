import 'package:get/get.dart';

import '../../global_asset/common.dart';
import '../../model/member.dart';

class MyInfoEditController extends GetxController {
  Member? member;
  Member? orgMember;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    //넘어온 데이터 확인
    getArgument();
  }

  //Member Data 조회
  void getArgument() {
    isLoading(true);
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      }
    }
    member ??= Member();
    isLoading(false);
  }

  void saveMemeber() {
    Common.showToast("저장되었습니다.");
  }

  void to01() {
    orgMember = Member.clone(member!);
    //다음 페이지
    Get.toNamed("/ResisterInfoStep01EditPage", arguments: {
      "member": member,
      "orgMember": orgMember,
      "toPage": "/MyInfoEdit"
    });
  }

  void to02() {
    orgMember = Member.clone(member!);
    //다음 페이지
    Get.toNamed("/ResisterInfoStep02EditPage", arguments: {
      "member": member,
      "orgMember": orgMember,
      "toPage": "/MyInfoEdit"
    });
  }

  void to03() {
    orgMember = Member.clone(member!);
    //다음 페이지
    Get.toNamed("/ResisterInfoStep03EditPage", arguments: {
      "member": member,
      "orgMember": orgMember,
      "toPage": "/MyInfoEdit"
    });
  }

  void to04() {
    orgMember = Member.clone(member!);
    //다음 페이지
    Get.toNamed("/ResisterInfoStep04EditPage", arguments: {
      "member": member,
      "orgMember": orgMember,
      "toPage": "/MyInfoEdit"
    });
  }

  void to05() {
    orgMember = Member.clone(member!);
    //다음 페이지
    Get.toNamed("/ResisterInfoStep05EditPage", arguments: {
      "member": member,
      "orgMember": orgMember,
      "toPage": "/MyInfoEdit"
    });
  }

  void to06() {
    orgMember = Member.clone(member!);
    //다음 페이지
    Get.toNamed("/ResisterInfoStep06EditPage", arguments: {
      "member": member,
      "orgMember": orgMember,
      "toPage": "/MyInfoEdit"
    });
  }
}
