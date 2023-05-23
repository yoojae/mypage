import 'package:get/get.dart';
import 'package:orot/model/member.dart';
import 'package:orot/model/term_agree.dart';

import '../../global_asset/common.dart';

class ResisterTermsPageController extends GetxController {
  static ResisterTermsPageController get to => Get.find();

  RxBool isCanNext = false.obs;
  Member member = Member();

  RxBool isMainAgreement = false.obs;
  RxList<bool> isSubAgreement = [false, false, false, false, false].obs;

  RxBool isRequired = false.obs;

  List<String> subtitle = [
    "[필수] 서비스 이용약관 동의",
    "[필수] 개인정보 수집 및 이용약관 동의",
    "[필수] 보안 및 데이터 활용 동의",
    "[선택] 위치기반 서비스 이용약관 동의",
    "[선택] 마케팅 정보 수신 및 활용 동의"
  ];

  List<String> subtitleLink = [
    "TermsViewWeb01",
    "TermsViewWeb01",
    "TermsViewWeb01",
    "TermsViewWeb01",
    "TermsViewWeb01"
  ];

  @override
  void onInit() {
    super.onInit();
    //checkUser();
  }

  //로그인된 사용자가 있으면
  void checkUser() async {
    String token = await Common.getToken();

    if (token.isNotEmpty) {
      Get.offAllNamed("Home");
    }
  }

  setCanNext() {
    isCanNext(isCanRequired());
  }

  void setMainAgreement(bool checkedValue) {
    isMainAgreement(!checkedValue);

    for (var i = 0; i < isSubAgreement.length; i++) {
      isSubAgreement[i] = !checkedValue;
    }
  }

  void setSubAgreement(int index, bool checkedValue) {
    isSubAgreement[index] = !checkedValue;

    if (checkedValue) {
      isMainAgreement(false);
    }
  }

  bool isCanRequired() {
    if (isSubAgreement[0] && isSubAgreement[1] && isSubAgreement[2]) {
      isRequired(true);
    } else {
      isRequired(false);
    }

    return isRequired.value;
  }

  void toNext() {
    //데이터 세팅한다.
    int i = 1;
    List<TermAgree> agrees = [];
    for (bool bAgree in isSubAgreement) {
      agrees.add(TermAgree(id: i, isAgree: bAgree ? 1 : 0));
      i = i + 1;
    }
    member.termAgree = agrees;

    //다음 페이지(본인인증)
    Get.toNamed("/ResisterInfoStep00Page", arguments: {"member": member});
  }
}
