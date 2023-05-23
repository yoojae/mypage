import 'package:get/get.dart';
import 'package:orot/model/member.dart';
import 'package:orot/model/user_type_result.dart';
import 'package:orot/repository/member_repository.dart';

class HomePageController extends GetxController {
  RxString userType = "".obs;

  Member? member;

  @override
  void onInit() async {
    super.onInit();
    //User Type Get
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

  void toNext() {
    //다음 페이지
    Get.toNamed("/MypageMain", arguments: {"member": member});
  }
}
