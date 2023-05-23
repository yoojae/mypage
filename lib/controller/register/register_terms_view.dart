import 'package:get/get.dart';
import 'package:orot/model/member.dart';

class ResisterTermsViewController extends GetxController {
  static ResisterTermsViewController get to => Get.find();

  Member member = Member();

  RxBool isMainAgreement = false.obs;
  RxList<bool> isSubAgreement = [false, false, false, false, false].obs;

  RxBool isRequired = false.obs;

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
}
