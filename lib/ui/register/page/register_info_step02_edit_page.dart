import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_step02_edit_page_controller.dart';
import 'package:orot/controller/register/register_info_step02_new_page_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/step_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

//PageId :ma03010200p
class ResisterInfoStep02EditPage
    extends GetView<ResisterInfoStep02EditPageController> {
  ResisterInfoStep02EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Container(
            height: Get.height,
            color: GlobalStyle.orot_bg,
            padding: EdgeInsets.only(bottom: 48.h, left: 20.w, right: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 56,
                        child: SvgPicture.asset(
                          'images/svg/btn_all_leave_medium.svg',
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 24.h),
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '초산/경산 여부',
                                    style: GlobalStyle.setTextStyle(
                                        'h2', 'bold', GlobalStyle.orot_black)),
                                TextSpan(
                                    text: '를',
                                    style: GlobalStyle.setTextStyle('h2',
                                        'regular', GlobalStyle.orot_black)),
                              ]))),
                          Container(
                            padding: EdgeInsets.only(top: 6.h),
                            alignment: Alignment.topLeft,
                            child: Text('선택해 주세요',
                                style: GlobalStyle.setTextStyle(
                                    'h2', 'regular', GlobalStyle.orot_black)),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 17.h),
                            child: Text(
                              '입력한 정보는 ‘마이페이지 > 개인정보 수정’에서 수정이 가능합니다.',
                              style: GlobalStyle.setTextStyle('h8', 'regular',
                                  GlobalStyle.orot_gray_darkest),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildResisterInfoStep02View()
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isCanNextButton.value) {
                      controller.toNext();
                    }
                  },
                  child: Container(
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.isCanNextButton.value
                          ? GlobalStyle.orot_primary
                          : GlobalStyle.orot_gray_light,
                      borderRadius: BorderRadius.circular(24.0.h),
                    ),
                    child: Text("확인",
                        style: GlobalStyle.setTextStyle(
                            'h4', 'bold', GlobalStyle.orot_white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResisterInfoStep02View() {
    return Container(
      padding: EdgeInsets.only(
        top: 48.h,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              controller.setPrimipara(!controller.isGPrimipara.value);
            },
            child: Container(
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.isGPrimipara.value
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '초산이에요',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.setNonePrimipara(!controller.isGNotPrimipara.value);
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.isGNotPrimipara.value
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '경산예요',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
          controller.isGNotPrimipara.value
              ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 32.h, left: 16.w),
                      child: Row(
                        children: [
                          SvgPicture.asset('images/svg/ic_ma_question.svg'),
                          Container(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              '유산 경험이 있으신가요?',
                              style: GlobalStyle.setTextStyle(
                                  'h4', 'semi_bold', GlobalStyle.orot_black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16.h, left: 16.w),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.setMiscarriageNo(
                                  controller.isMiscarriageNo.value);
                            },
                            child: Row(
                              children: [
                                controller.isMiscarriageNo.value
                                    ? SvgPicture.asset(
                                        'images/svg/ic_ma_radio_pressed.svg')
                                    : SvgPicture.asset(
                                        'images/svg/ic_ma_radio_normal.svg'),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 8.w, right: 16.w),
                                  child: Text(
                                    '있어요',
                                    style: GlobalStyle.setTextStyle(
                                        'h4', 'medium', GlobalStyle.orot_black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setMiscarriageYes(
                                  controller.isMiscarriageYes.value);
                            },
                            child: Row(
                              children: [
                                controller.isMiscarriageYes.value
                                    ? SvgPicture.asset(
                                        'images/svg/ic_ma_radio_pressed.svg')
                                    : SvgPicture.asset(
                                        'images/svg/ic_ma_radio_normal.svg'),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 8.w,
                                  ),
                                  child: Text(
                                    '없어요',
                                    style: GlobalStyle.setTextStyle(
                                        'h4', 'medium', GlobalStyle.orot_black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
