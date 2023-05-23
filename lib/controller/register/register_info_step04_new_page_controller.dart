import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:orot/controller/global_asset/bottom_calender_controller.dart';
import 'package:orot/model/member.dart';
import 'package:orot/model/unborn.dart';

class ResisterInfoStep04NewPageController extends GetxController {
  static ResisterInfoStep04NewPageController get to => Get.find();

  //회원정보
  Member? member;

  RxInt babyCount = 0.obs;
  RxBool isCanNextButton = false.obs;

  RxString choiceDate = "출산 예정일을 선택하세요".obs;
  int babyIndex = 0;

  FocusNode textFocus = FocusNode();
  List<FocusNode> textFocusList = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];

  @override
  void onInit() {
    super.onInit();
    getArgument();
    if (!Get.isRegistered<BottomCalenderController>()) {
      Get.put(BottomCalenderController());
    }
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
    babyCount(member?.unborns?.length ?? 0);
  }

  void setUnBornBabyName(int index, String babyName) {
    if (member?.unborns != null && member!.unborns!.length > index) {
      member?.unborns?[index].unbornBabyName = babyName;
      isCanNext();
    }
  }

  void setDueDate(String dueDate) {
    choiceDate(dueDate);

    String replaceDueDate = dueDate.removeAllWhitespace.replaceAll("/", "-");

    if (member?.unborns != null) {
      for (Unborn unbornbaby in member!.unborns!) {
        unbornbaby.dueDate = replaceDueDate;
      }
    }

    isCanNext();
  }

  void isCanNext() {
    bool isCan = true;

    if (member?.unborns != null) {
      for (Unborn unbornbaby in member!.unborns!) {
        if (unbornbaby.dueDate == null || unbornbaby.unbornBabyName == null) {
          isCan = false;
          break;
        }
        if (unbornbaby.dueDate!.isEmpty || unbornbaby.unbornBabyName!.isEmpty) {
          isCan = false;
          break;
        }
      }

      List<String> unBornNames = member!.unborns!.map((e) => e.unbornBabyName ?? "").toList();

      Set<String> setBornNames = unBornNames.toSet();

      if (setBornNames.length != unBornNames.length) {
        isCan = false;
      }
    }

    isCanNextButton(isCan);
  }

  void toNext() {
    //다음 페이지
    Get.toNamed("/ResisterInfoStep05Page", arguments: {"member": member});
  }

  void foucsOut() {
    textFocus.unfocus();
    for (var ctnTextFocus in textFocusList) {
      ctnTextFocus.unfocus();
    }
  }
}
