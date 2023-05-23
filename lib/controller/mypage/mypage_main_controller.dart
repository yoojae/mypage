import 'package:get/get.dart';
import 'package:orot/model/member.dart';
import '../../global_asset/common.dart';
import '../../repository/member_repository.dart';
import 'package:orot/model/user_type_result.dart';

class MypageMainController extends GetxController {
  RxBool isLockChoice = false.obs;
  RxBool isBioChoice = false.obs;
  RxBool isLoading = false.obs;
  RxString userType = "".obs;
  Member? member;

  @override
  void onInit() async {
    super.onInit();
    await getMemberInfo();
    await getUserType();
  }

  Future<void> getUserType() async {
    if (!Get.isRegistered<MemberRepository>()) {
      Get.put(MemberRepository());
    }
    try {
      UserTypeResult result = await MemberRepository.to.getMemeberType();

      if (result.success ?? false) {
        userType(result.data?.type ?? "general");
      }
    } catch (e) {
      userType("general");
    }
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

  void toMyinfo() {
    //다음 페이지
    Get.toNamed("/MyInfo", arguments: {"member": member});
  }
}
