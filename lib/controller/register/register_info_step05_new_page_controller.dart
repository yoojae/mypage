import 'package:get/get.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/model/disease.dart';
import 'package:orot/model/disease_list.dart';
import 'package:orot/model/member.dart';
import 'package:orot/repository/common_repository.dart';

class ResisterInfoStep05NewPageController extends GetxController {
  static ResisterInfoStep05NewPageController get to => Get.find();

  //회원정보
  Member? member;

  RxList<Disease> list = <Disease>[].obs;
  RxBool isDisease = false.obs;
  RxBool isNotDisease = false.obs;
  RxBool isUnkownDisease = false.obs;
  RxBool isCanNextButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    getArgument();
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
  }

  //STEP 05
  void getDiseaseList() async {
    if (!Get.isRegistered<CommmonRepository>()) {
      Get.put(CommmonRepository());
    }
    list.clear();

    DiseaseList diseaseList = await CommmonRepository.to.getDiseaseList();

    //데이터 넣기
    list(diseaseList.data?.where((element) => element.type == 'pre').toList());
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
    member?.preDisease = isDisease.value
        ? "yes"
        : isNotDisease.value
            ? "no"
            : "not";
    member?.diseases = list.where((p0) => p0.isSelected ?? false).toList();
    //다음 페이지
    Get.toNamed("/ResisterInfoStep06Page", arguments: {"member": member});
  }
}
