import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:orot/model/member.dart';

class RegisterLockBioUseController extends GetxController {
  static RegisterLockBioUseController get to => Get.find();

  Member? member;

  Future<bool> canLocalAuth() async {
    return await LocalAuthentication().canCheckBiometrics;
  }

  void toNext() {
    //다음 페이지
    Get.toNamed("/LockNumber", arguments: {"member": member});
    //그냥 다음페이지
  }
}
