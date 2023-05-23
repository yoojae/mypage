import 'package:get/get.dart';
import 'package:orot/global_asset/common.dart';

import '../../model/member.dart';
import '../../repository/member_repository.dart';

class MyInfoController extends GetxController {
  Member? member;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getMemberInfo();
  }

  getMemberInfo() async {
    if (!Get.isRegistered<MemberRepository>()) {
      Get.put(MemberRepository());
    }
    try {
      isLoading(true);
      member = await MemberRepository.to.getMember();
      isLoading(false);
    } catch (e) {
      Common.showToast("사용자 정보 호출을 실패했습니다.");
    }
  }

  toEdit() {
    Get.toNamed("/MyInfoEdit", arguments: {"member": member});
  }
}
