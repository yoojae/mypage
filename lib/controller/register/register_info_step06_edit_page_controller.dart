import 'package:get/get.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/model/disease.dart';
import 'package:orot/model/disease_list.dart';
import 'package:orot/model/member.dart';
import 'package:orot/repository/common_repository.dart';

class ResisterInfoStep06EditPageController extends GetxController {
  static ResisterInfoStep06EditPageController get to => Get.find();

  //회원정보
  Member? member;
  Member? orgMember;
  RxList<Disease> list = <Disease>[].obs;
  RxBool isDisease = false.obs;
  RxBool isNotDisease = false.obs;
  RxBool isUnkownDisease = false.obs;
  RxBool isCanNextButton = false.obs;
  String? toPage;

  @override
  void onInit() {
    super.onInit();
    getArgument();
  }

  void getArgument() {
    if (Get.arguments is Map) {
      if ((Get.arguments as Map).containsKey("member")) {
        member = Get.arguments["member"];
      }
      if ((Get.arguments as Map).containsKey("orgMember")) {
        orgMember = Get.arguments["orgMember"];
      }
      if ((Get.arguments as Map).containsKey("toPage")) {
        toPage = Get.arguments["toPage"];
      }
    }
    member ??= Member();
  }

  void getDiseaseList() async {
    if (!Get.isRegistered<CommmonRepository>()) {
      Get.put(CommmonRepository());
    }
    list.clear();

    DiseaseList diseaseList = await CommmonRepository.to.getDiseaseList();

    //데이터 넣기
    list(
        diseaseList.data?.where((element) => element.type == 'after').toList());
  }

  //질병선택일때
  void setDisease() {
    isDisease(!isDisease.value);
    if (isDisease.value) getDiseaseList();
    isNotDisease(false);
    isUnkownDisease(false);

    isCanNextButton(false);
  }

  void setNotDisease() {
    isNotDisease(!isNotDisease.value);
    isDisease(false);
    isUnkownDisease(false);
    list.clear();

    isCanNextButton(isNotDisease.value);
  }

  void setUnkownDisease() {
    isUnkownDisease(!isUnkownDisease.value);
    isDisease(false);
    isNotDisease(false);
    list.clear();

    isCanNextButton(isUnkownDisease.value);
  }

  void checkDisease(int? id) {
    Disease selectedDisease = list.where((p0) => p0.id == id).first;

    selectedDisease.isSelected = !selectedDisease.isSelected!;

    list.refresh();

    isCanNextButton(
        list.where((p0) => p0.isSelected ?? false == true).isNotEmpty);
  }

  void toNext() {
    member?.afterDisease = isDisease.value
        ? "yes"
        : isNotDisease.value
            ? "no"
            : "not";

    //이전 상황에 데이터가 있었다면 추가, 아니면 신규
    if (member?.diseases != null && member!.diseases!.isNotEmpty) {
      member?.diseases!.removeWhere((element) => element.type == "after");
      member?.diseases!
          .addAll(list.where((p0) => p0.isSelected ?? false).toList());
    } else {
      member?.diseases = list.where((p0) => p0.isSelected ?? false).toList();
    }
    //다음 페이지
    if (toPage != null && toPage!.isNotEmpty) {
      Get.toNamed(toPage!, arguments: {"member": member});
    } else {
      //다음 페이지(주소지 입력)
      Get.toNamed("/ResisterInfoAllEditPage",
          arguments: {"member": member, "orgMember": orgMember});
    }
  }
}
