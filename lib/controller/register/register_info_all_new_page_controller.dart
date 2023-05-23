import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orot/model/member.dart';
import 'package:orot/model/mem_result.dart';
import '../../global_asset/common.dart';

class ResisterInfoAllNewPageController extends GetxController {
  static ResisterInfoAllNewPageController get to => Get.find();

  Member? member;
  RxString displayUnbornName = "".obs;
  RxInt displayDiseasePreCount = 0.obs;
  RxString displayDiseasePreName = "".obs;

  RxInt displayDiseaseAfterCount = 0.obs;
  RxString displayDiseaseAfterName = "".obs;

  RxString dueDate = "".obs;

  RxBool isRegistered = false.obs;

  @override
  void onInit() {
    super.onInit();
    getArgument();
    getInitValue();
  }

  void getArgument() {
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      }
    }
    member ??= Member();
  }

  void getInitValue() {
    //출산예정일
    String tmpName = "";

    //태아 명
    displayUnbornName("");

    //나이 계산
    String ageTemp = "";

    if (member?.residentNumber != null && member!.residentNumber!.isNotEmpty) {
      if (member!.residentNumber!.length == 6) {
        ageTemp = (member!.residentNumber!.substring(0, 2).compareTo("10") > 0
                ? "19"
                : "20") +
            member!.residentNumber!;
      }

      member?.age = int.parse(Common.calculateAge(DateTime.parse(ageTemp)));
    }

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

    //기존 회원여부
    Common.getToken().then((value) {
      if (value.isNotEmpty) {
        isRegistered(true);
      } else {
        isRegistered(false);
      }
    });
  }

  void toNext() {
    //다음 페이지
    Get.toNamed("/ResisterNewLoginNumber", arguments: {"member": member});
  }

  void toEdit() {
    Member orgMember = Member.clone(member!);
    Get.toNamed('ResisterInfoAllEditPage',
        arguments: {"member": member, "orgMember": orgMember});
  }

  void toAllEdit() {
    Member orgMember = Member.clone(member!);
    Get.toNamed('ResisterInfoStep01EditPage',
        arguments: {"member": member, "orgMember": orgMember});
  }
}
