import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orot/model/member.dart';

class ResisterInfoAllEditPageController extends GetxController {
  static ResisterInfoAllEditPageController get to => Get.find();

  Member? member;
  Member? orgMember;
  RxString displayUnbornName = "".obs;
  RxInt displayDiseasePreCount = 0.obs;
  RxString displayDiseasePreName = "".obs;

  RxInt displayDiseaseAfterCount = 0.obs;
  RxString displayDiseaseAfterName = "".obs;

  RxString orgDisplayUnbornName = "".obs;
  RxInt orgDisplayDiseasePreCount = 0.obs;
  RxString orgDisplayDiseasePreName = "".obs;

  RxInt orgDisplayDiseaseAfterCount = 0.obs;
  RxString orgDisplayDiseaseAfterName = "".obs;

  RxString dueDate = "".obs;
  RxString orgDueDate = "".obs;

  @override
  void onInit() {
    super.onInit();
    getArgument();
    getInitValue();
    getInitValue2();
  }

  void getArgument() {
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      }
      if ((Get.arguments as Map).containsKey("orgMember")) {
        orgMember = Get.arguments["orgMember"];
      }
    }
    member ??= Member();
  }

  void getInitValue() {
    //출산예정일
    String tmpName = "";

    //태아 명
    displayUnbornName("");

    if (member?.unborns != null) {
      for (int i = 0; i < member!.unborns!.length; i++) {
        if (member!.unborns!.length - 1 == i) {
          //출산 예정일
          String strDueDate = member?.unborns?[i].dueDate ?? "";

          if (strDueDate.isNotEmpty) {
            dueDate(
                DateFormat('yy년 MM월 dd일').format(DateTime.parse(strDueDate)));
          }
        } else {
          tmpName = tmpName + (member?.unborns?[i].unbornBabyName ?? "");

          if (tmpName.length > 5) {
            member?.unborns?[i].isEnter = true;
            tmpName = "";
          }

          //뒤에 태명이 6글자 넘으면 앞에 엔터 처리
          if ((i + 1) < member!.unborns!.length) {
            if ((member?.unborns?[i + 1].unbornBabyName?.length ?? 0) > 5) {
              member?.unborns?[i].isEnter = true;
              tmpName = "";
            }
          }
        }
      }
    }

    //임신전 질병
    if (member != null &&
        member?.diseases != null &&
        member!.diseases!.isNotEmpty) {
      //임신전 질병 선택 수
      displayDiseasePreCount(
          member!.diseases!.where((element) => element.type == "pre").length);

      //임신후 질병 선택 수
      displayDiseaseAfterCount(
          member!.diseases!.where((element) => element.type == "after").length);

      //임신전 질병 이름
      if (displayDiseasePreCount.value == 1) {
        displayDiseasePreName("  " +
            (member!.diseases!
                    .where((element) => element.type == "pre")
                    .first
                    .name ??
                "") +
            "  ");
      }

      if (displayDiseasePreCount.value > 1) {
        displayDiseasePreName(
            "  ${member!.diseases!.where((element) => element.type == "pre").first.name ?? ""}외 ${displayDiseasePreCount.value - 1}개  ");
      }

      //임신후 질병 이름
      if (displayDiseaseAfterCount.value == 1) {
        displayDiseaseAfterName("  " +
            (member!.diseases!
                    .where((element) => element.type == "after")
                    .first
                    .name ??
                "") +
            "  ");
      }

      if (displayDiseaseAfterCount.value > 1) {
        displayDiseaseAfterName(
            "  ${member!.diseases!.where((element) => element.type == "after").first.name ?? ""}외 ${displayDiseasePreCount.value - 1}개  ");
      }
    }
  }

  void getInitValue2() {
    //출산예정일
    String tmpName = "";

    //태아 명
    orgDisplayUnbornName("");

    if (orgMember?.unborns != null) {
      for (int i = 0; i < orgMember!.unborns!.length; i++) {
        if (orgMember!.unborns!.length - 1 == i) {
          //출산 예정일
          String strDueDate = orgMember?.unborns?[i].dueDate ?? "";

          if (strDueDate.isNotEmpty) {
            orgDueDate(
                DateFormat('yy년 MM월 dd일').format(DateTime.parse(strDueDate)));
          }
        } else {
          tmpName = tmpName + (orgMember?.unborns?[i].unbornBabyName ?? "");

          if (tmpName.length > 5) {
            orgMember?.unborns?[i].isEnter = true;
            tmpName = "";
          }

          //뒤에 태명이 6글자 넘으면 앞에 엔터 처리
          if ((i + 1) < orgMember!.unborns!.length) {
            if ((orgMember?.unborns?[i + 1].unbornBabyName?.length ?? 0) > 5) {
              orgMember?.unborns?[i].isEnter = true;
              tmpName = "";
            }
          }
        }
      }
    }

    //임신전 질병
    if (orgMember != null &&
        orgMember?.diseases != null &&
        orgMember!.diseases!.isNotEmpty) {
      //임신전 질병 선택 수
      orgDisplayDiseasePreCount(orgMember!.diseases!
          .where((element) => element.type == "pre")
          .length);

      //임신후 질병 선택 수
      orgDisplayDiseaseAfterCount(orgMember!.diseases!
          .where((element) => element.type == "after")
          .length);

      //임신전 질병 이름
      if (orgDisplayDiseasePreCount.value == 1) {
        orgDisplayDiseasePreName("  " +
            (orgMember!.diseases!
                    .where((element) => element.type == "pre")
                    .first
                    .name ??
                "") +
            "  ");
      }

      if (orgDisplayDiseasePreCount.value > 1) {
        orgDisplayDiseasePreName(
            "  ${orgMember!.diseases!.where((element) => element.type == "pre").first.name ?? ""}외 ${orgDisplayDiseasePreCount.value - 1}개  ");
      }

      //임신후 질병 이름
      if (orgDisplayDiseaseAfterCount.value == 1) {
        orgDisplayDiseaseAfterName("  " +
            (orgMember!.diseases!
                    .where((element) => element.type == "after")
                    .first
                    .name ??
                "") +
            "  ");
      }

      if (orgDisplayDiseaseAfterCount.value > 1) {
        orgDisplayDiseaseAfterName(
            "  ${orgMember!.diseases!.where((element) => element.type == "after").first.name ?? ""}외 ${orgDisplayDiseasePreCount.value - 1}개  ");
      }
    }
  }

  bool isCanNext() {
    if (member != null && orgMember != null) {
      if (member!.address != orgMember!.address) {
        return true;
      }
      if (member!.isWork != orgMember!.isWork) {
        return true;
      }
      if (member!.deliver != orgMember!.deliver) {
        return true;
      }
      if (member!.isMiscarriage != orgMember!.isMiscarriage) {
        return true;
      }
      if (member!.preDisease != orgMember!.preDisease) {
        return true;
      }
      if (member!.afterDisease != orgMember!.afterDisease) {
        return true;
      }
      if (member!.unborns?.length != orgMember!.unborns?.length) {
        return true;
      }
      if (member!.diseases?.length != orgMember!.diseases?.length) {
        return true;
      }
    }

    return false;
  }

  void toNext() {
    //다음 페이지
    Get.toNamed("/ResisterInfoAllNewPage",
        arguments: {"member": member, "orgMember": orgMember});
  }

  void to01() {
    //다음 페이지
    Get.toNamed("/ResisterInfoStep01EditPage",
        arguments: {"member": member, "orgMember": orgMember});
  }

  void to02() {
    //다음 페이지
    Get.toNamed("/ResisterInfoStep02EditPage",
        arguments: {"member": member, "orgMember": orgMember});
  }

  void to03() {
    //다음 페이지
    Get.toNamed("/ResisterInfoStep03EditPage",
        arguments: {"member": member, "orgMember": orgMember});
  }

  void to04() {
    //다음 페이지
    Get.toNamed("/ResisterInfoStep04EditPage",
        arguments: {"member": member, "orgMember": orgMember});
  }

  void to05() {
    //다음 페이지
    Get.toNamed("/ResisterInfoStep05EditPage",
        arguments: {"member": member, "orgMember": orgMember});
  }

  void to06() {
    //다음 페이지
    Get.toNamed("/ResisterInfoStep06EditPage",
        arguments: {"member": member, "orgMember": orgMember});
  }
}
