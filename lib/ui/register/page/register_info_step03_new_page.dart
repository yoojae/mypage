import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_step03_new_page_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/step_bar.dart';

//PageId :ma03010300p
class ResisterInfoStep03Page
    extends GetView<ResisterInfoStep03NewPageController> {
  ResisterInfoStep03Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCenterTitle(),
      body: SafeArea(
        child: Obx(
          () => Container(
            color: GlobalStyle.orot_bg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const StepBar(
                      currentIndex: 3,
                    ),
                    Container(
                      padding: AppbarTLRPadding(context),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '단태아/다태아 여부',
                                    style: GlobalStyle.setTextStyle(
                                        'h2', 'bold', GlobalStyle.orot_black)),
                                TextSpan(
                                    text: '를',
                                    style: GlobalStyle.setTextStyle('h2',
                                        'regular', GlobalStyle.orot_black)),
                              ]))),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 6.h),
                            child: Text('선택해 주세요',
                                style: GlobalStyle.setTextStyle(
                                    'h2', 'regular', GlobalStyle.orot_black)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 17.h),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '입력한 정보는 ‘마이페이지 > 개인정보 수정’에서 수정이 가능합니다.',
                              style: GlobalStyle.setTextStyle('h8', 'regular',
                                  GlobalStyle.orot_gray_darkest),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildResisterInfoStep03View()
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isCanNextButton.value) {
                      controller.toNext();
                    }
                  },
                  child: Container(
                    margin: ButtonAllPadding(context),
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.isCanNextButton.value
                          ? GlobalStyle.orot_primary
                          : GlobalStyle.orot_gray_light,
                      borderRadius: BorderRadius.circular(24.0.h),
                    ),
                    child: Text("다음",
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

  Widget buildResisterInfoStep03View() {
    return Container(
      padding: EdgeInsets.only(top: 48.h, left: 20.w, right: 20.w),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              controller.setBabyCount(1);
            },
            child: Container(
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.babyCount.value == 1
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '단태아',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.setBabyCount(2);
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.babyCount.value > 1
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '다태아',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
          controller.babyCount.value > 1
              ? AnimatedContainer(
                  curve: Curves.easeIn,
                  margin: EdgeInsets.only(top: 8.h),
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24.h)),
                      color: GlobalStyle.orot_gray_lightest),
                  duration: const Duration(milliseconds: 1000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.minusBabyCount();
                        },
                        child: SvgPicture.asset(
                          'images/svg/ic_ma_minus.svg',
                        ),
                      ),
                      Text(
                        '${controller.babyCount.value}명',
                        style: GlobalStyle.setTextStyle(
                            'h6', 'midium', GlobalStyle.orot_black),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.plusBabyCount();
                        },
                        child: SvgPicture.asset(
                          'images/svg/ic_ma_plus.svg',
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
