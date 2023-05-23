import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomCalenderController extends GetxController {
  static BottomCalenderController get to => Get.find();

  RxString selectedString =
      DateFormat('yyyy년 MM월 dd일').format(DateTime.now()).obs;
}
