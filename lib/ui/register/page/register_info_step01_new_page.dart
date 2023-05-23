import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_step01_new_page_controller.dart';
import 'package:orot/global_asset/address_select.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/step_bar.dart';

//PageId :ma01000000p
class ResisterInfoStep01Page
    extends GetView<ResisterInfoStep01NewPageController> {
  ResisterInfoStep01Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCenterTitle(),
      body: Container(
        color: GlobalStyle.orot_bg,
        child: Obx(
          () => SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const StepBar(
                      currentIndex: 1,
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
                                    text: '현재',
                                    style: GlobalStyle.setTextStyle('h2',
                                        'regular', GlobalStyle.orot_black)),
                                TextSpan(
                                    text: ' 거주중인 지역',
                                    style: GlobalStyle.setTextStyle(
                                        'h2', 'bold', GlobalStyle.orot_black)),
                                TextSpan(
                                    text: '과',
                                    style: GlobalStyle.setTextStyle('h2',
                                        'regular', GlobalStyle.orot_black)),
                              ]))),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(top: 6.h),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '근로여부',
                                    style: GlobalStyle.setTextStyle(
                                        'h2', 'bold', GlobalStyle.orot_black)),
                                TextSpan(
                                    text: '를 선택해 주세요',
                                    style: GlobalStyle.setTextStyle('h2',
                                        'regular', GlobalStyle.orot_black)),
                              ]))),
                          Container(
                            padding: EdgeInsets.only(top: 17.h),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '입력한 정보는 ‘마이페이지 > 개인정보 수정’에서 수정이 가능합니다.',
                              style: GlobalStyle.setTextStyle('h8', 'regular',
                                  GlobalStyle.orot_gray_darkest),
                            ),
                          ),
                          buildResisterInfoStep01View(context)
                        ],
                      ),
                    ),
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

  Widget buildResisterInfoStep01View(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 48.h,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '지역을 선택하세요',
            style: GlobalStyle.setTextStyle(
                'h6', 'medium', GlobalStyle.orot_gray_darkest),
          ),
          GestureDetector(
            onTap: () {
              //Get.toNamed("/AddressSelect");
              const AddressSelect().showLongHeightModalBottomSheet(
                  context, controller.setAddress);
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: GlobalStyle.orot_gray_lightest,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Text(controller.selectedArea.value,
                  style: GlobalStyle.setTextStyle(
                      'h6', 'regular', GlobalStyle.orot_gray_dark)),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 24.h),
                child: Text(
                  '근로여부 선택',
                  style: GlobalStyle.setTextStyle(
                      'h6', 'medium', GlobalStyle.orot_gray_darkest),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 24.h, left: 4.w),
                child: SvgPicture.asset(
                  'images/svg/ic_ma_info.svg',
                ),
              )
            ],
          ),
          // 사각형 3363
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.setWorker(!controller.isGWorker.value);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8.h),
                  width: 156.w,
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24.h)),
                      color: controller.isGWorker.value
                          ? GlobalStyle.orot_primary
                          : GlobalStyle.orot_primary_lighter),
                  child: Text(
                    '근로자예요',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.setNoneWorker(!controller.isGNotWorker.value);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8.h),
                  width: 156.w,
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24.h)),
                      color: controller.isGNotWorker.value
                          ? GlobalStyle.orot_primary
                          : GlobalStyle.orot_primary_lighter),
                  child: Text(
                    '비근로자예요',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
