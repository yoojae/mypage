import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/model/member.dart';

import '../../model/mem_result.dart';
import '../../repository/member_repository.dart';

class ResisterInfoStep00NewPageController extends GetxController {
  static ResisterInfoStep00NewPageController get to => Get.find();

  RxBool isCanNextButton = false.obs;
  Member? member;
  String phoneNumber = "";

  @override
  void onInit() {
    super.onInit();
    //넘어온 데이터 확인
    getArgument();
  }

  //Member Data 조회
  void getArgument() {
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      }
    }
    member ??= Member();
  }

  //이름 변경시
  void onNameChange(String value) {
    member?.name = value;
    isCanNext();
  }

  //전화번호 변경시
  void onPhoneNumberChange(String value) {
    member?.phoneNumber = value;
    phoneNumber = value;
    isCanNext();
  }

  //생년월일 변경시
  void onResidentNumberChange(String value) {
    member?.residentNumber = value.replaceAll("-", "");

    isCanNext();
  }

  //활성화여부
  void isCanNext() {
    if (member == null) {
      isCanNextButton(false);
      return;
    }

    if (member!.name == null) {
      isCanNextButton(false);
      return;
    }

    if (member!.name!.isEmpty) {
      isCanNextButton(false);
      return;
    }

    if (member!.residentNumber == null) {
      isCanNextButton(false);
      return;
    }
    if (member!.residentNumber!.isEmpty) {
      isCanNextButton(false);
      return;
    }

    if (member!.phoneNumber == null) {
      isCanNextButton(false);
      return;
    }

    if (member!.phoneNumber!.isEmpty) {
      isCanNextButton(false);
      return;
    }

    isCanNextButton(true);
  }

  void toNext() async {
    String ageTemp = "";

    //나이 계산
    if (member?.residentNumber != null && member!.residentNumber!.isNotEmpty) {
      if (member!.residentNumber!.length == 6) {
        ageTemp = (member!.residentNumber!.substring(0, 2).compareTo("10") > 0
                ? "19"
                : "20") +
            member!.residentNumber!;
      }

      member?.age = int.parse(Common.calculateAge(DateTime.parse(ageTemp)));
      member?.uuid = await Common.getMobileId();
      member?.mobileCarrier = 'KT';
    }

    if (!Get.isRegistered<MemberRepository>()) {
      Get.put(MemberRepository());
    }

    MemResult result = await MemberRepository.to
        .exists(member!.residentNumber!, member!.name!);

    //회원이 있으면
    if (result.status == 200 && result.data != null) {
      //UUID랑 authToken 저장
      await Common.saveServerReturnMemberData(
          result.data?.authToken, result.data?.uuid);

      //회원조회
      member = await MemberRepository.to.getMember();

      if (member != null && (phoneNumber != member!.phoneNumber)) {
        member!.phoneNumber = phoneNumber;
        //업데이트
        await MemberRepository.to.saveAuthData(member!);
      }

      //회원 가입관련 팝업 선택 하면 가기
      Get.toNamed("/ResisterInfoAllNewPage", arguments: {"member": member});
    } else {
      //회원이 없으면 빈값으로 업데이트
      await Common.saveServerReturnMemberData("", "");
      //다음 페이지(주소지 입력)
      Get.toNamed("/ResisterInfoStep01Page", arguments: {"member": member});
    }
  }
}
