import 'package:get/get.dart';
import 'package:orot/controller/register/register_lock_biouse_controller.dart';
import 'package:orot/model/mem_result.dart';
import 'package:orot/model/member.dart';
import 'package:orot/repository/member_repository.dart';

import '../../global_asset/common.dart';

class RegisterLockUseController extends GetxController {
  static RegisterLockUseController get to => Get.find();

  Member? member;

  RxBool isNext = false.obs;
  RxBool isUse = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<Common>()) {
      Get.put(Common());
    } else {
      member = Member();
    }

    if (!Get.isRegistered<RegisterLockBioUseController>()) {
      Get.put(RegisterLockBioUseController());
    }

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

  void setUse(bool value) {
    isNext(false);
    isUse(!value);
    member?.isSecurity = !value;
  }

  void saveLocalData() {
    Common.saveLocalMemberData(member);
  }

  Future<bool> registerMember() async {
    if (!Get.isRegistered<MemberRepository>()) {
      Get.put(MemberRepository());
    }

    if (member != null) {
      MemResult result = await MemberRepository.to.signup(member!);

      if (result.success ?? false) {
        //리턴값 저장하기
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

  void toNext() {
    //회원 가입 시키고
    //offName사용
    //로컬로 저장 하기
    saveLocalData();

    registerMember().then((value) {
      if (value) {
        Get.toNamed("/WelcometoNew", arguments: {"member": member});
      }
    });
    //그냥 다음페이지
  }
}
