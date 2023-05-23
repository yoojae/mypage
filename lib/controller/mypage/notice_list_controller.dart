import 'package:get/get.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/model/notice.dart';
import 'package:orot/model/noticeList.dart';
import 'package:orot/repository/notice_repository.dart';

class NoticeListController extends GetxController {
  RxBool isLoading = false.obs;
  Notice? notice;
  NoticeList? noticeList;

  @override
  void onInit() async {
    super.onInit();
    await getNotice();
  }

  Future<void> getNotice() async {
    if (!Get.isRegistered<NoticeRepository>()) {
      Get.put(NoticeRepository());
    }
    try {
      // NoticeListModel notice = await NoticeRepository.to.getNoticeList();
      isLoading(true);
      noticeList = await NoticeRepository.to.getNoticeList();
      isLoading(false);
    } catch (e) {
      Common.showToast("사용자 정보 호출을 실패했습니다.");
    }
  }
}
