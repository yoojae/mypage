
import 'package:get/get.dart';


import '../../global_asset/common.dart';

class WelcometoNewController extends GetxController {
  static WelcometoNewController get to => Get.find();

  RxString userName = "".obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    userName(await Common.getSavedUserName());
  }
}
