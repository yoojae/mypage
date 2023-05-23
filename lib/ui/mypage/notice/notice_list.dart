import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/notice_list_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/model/notice.dart';

//PageId :li01010000p
class NoticeList extends GetView<NoticeListController> {
  NoticeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NoticeListController());
    return Scaffold(
        appBar: AppCenterTitle(
          displayName: '공지사항',
        ),
        body: SafeArea(
          bottom: false,
          child: Obx(
            () => controller.isLoading.value
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Container(
                      color: GlobalStyle.orot_bg,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 16.h),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                margin: EdgeInsets.only(bottom: 24.h),
                                child: Container(
                                  height: 32.h,
                                  padding:
                                      EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: GlobalStyle.orot_gray_lightest,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: TextField(
                                    maxLines: 1,
                                    cursorColor: GlobalStyle.orot_gray_dark,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '검색어를 입력해주세요',
                                      hintStyle: GlobalStyle.setTextStyle('h6',
                                          'medium', GlobalStyle.orot_gray_dark),
                                      suffixIcon: SvgPicture.asset(
                                        'images/svg/ic_mp_search.svg',
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                          minHeight: 24.h, minWidth: 24.w),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  width: 1.sw,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: const Color(0xfff5f7fa))),
                              Container(
                                height: 8.h,
                              ),
                              (controller.noticeList == null ||
                                      controller.noticeList!.data == null)
                                  ? Container()
                                  : ListView.separated(
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 20.w),
                                      itemCount: 10,
                                      itemBuilder: (_, index) {
                                        return _buildNoticeListDetail(controller
                                            .noticeList!.data![index]);
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          thickness: 1,
                                          color: GlobalStyle.orot_gray_lighter,
                                        );
                                      },
                                      shrinkWrap: true,
                                      primary: false),
                              Container(
                                padding: EdgeInsets.only(top: 16.h),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }

  Widget _buildNoticeListDetail(Notice notice) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      title: Container(
        padding: EdgeInsets.only(left: 8.w),
        height: 73.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed('/NoticeView');
              },
              child: Text(
                " ${notice.title ?? ""} ",
                style: GlobalStyle.setTextStyle(
                    'h4', 'semi_bold', GlobalStyle.orot_black),
              ),
            ),
            Container(
              height: 8.h,
            ),
            Text(
              " ${notice.createdAt ?? ""} ",
              style: GlobalStyle.setTextStyle(
                  'h8', 'regular', GlobalStyle.orot_gray_darker),
            )
          ],
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
