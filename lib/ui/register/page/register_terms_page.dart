// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_terms_page_controller.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/global_common_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

//PageId :ma01000000p

class ResisterTermsPage extends GetView<ResisterTermsPageController> {
  const ResisterTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Container(
            padding: AppbarlessAllPadding(context),
            color: GlobalStyle.orot_bg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        CommonDaialog(
                          height: 154.h,
                          width: 312.w,
                          buttonCount: 2,
                          contents: '오롯 사용을 중단 하시겠습니까?',
                          subcontents: '확인을 누르면 앱 사용이 중단됩니다.',
                        ).show();
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
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 40.h, bottom: 6.h),
                      child: Text("오롯에 오신걸 환영해요!",
                          style: GlobalStyle.setTextStyle(
                              'h2', 'regular', GlobalStyle.orot_black)),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: '가입약관',
                              style: GlobalStyle.setTextStyle(
                                  'h2', 'bold', GlobalStyle.orot_black)),
                          TextSpan(
                              text: '을 확인해 주세해요',
                              style: GlobalStyle.setTextStyle(
                                  'h2', 'regular', GlobalStyle.orot_black)),
                        ]))),
                    //약관 동의 체크리스트
                    _ResisterTermsView()
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isCanNext.value) {
                      controller.toNext();
                    }
                  },
                  child: Container(
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.isCanNext.value
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

  Widget _ResisterTermsView() {
    return Obx(
      () => Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 41.h, left: 0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              controller.setMainAgreement(
                                  controller.isMainAgreement.value);

                              controller.setCanNext();
                            },
                            child: Container(
                                padding: EdgeInsets.only(right: 10.w),
                                child: controller.isMainAgreement.value
                                    ? SvgPicture.asset(
                                        'images/svg/ic_ma_check_01_pressed.svg')
                                    : SvgPicture.asset(
                                        'images/svg/ic_ma_check_01_nomal.svg')),
                          ),
                        ),
                        Container(
                          child: Text("전체 동의",
                              style: GlobalStyle.setTextStyle(
                                  'h3', 'bold', GlobalStyle.orot_black)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //잔체의의
            widgetSubAgreement(0),
            widgetSubAgreement(1),
            widgetSubAgreement(2),
            widgetSubAgreement(3),
            widgetSubAgreement(4)
          ],
        ),
      ),
    );
  }

  Widget widgetSubAgreement(int index) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(top: 21.h, left: 0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      controller.setSubAgreement(
                          index, controller.isSubAgreement[index]);
                      controller.setCanNext();
                    },
                    child: controller.isSubAgreement[index]
                        ? SvgPicture.asset(
                            'images/svg/ic_ma_check_02_pressed.svg',
                          )
                        : SvgPicture.asset(
                            'images/svg/ic_ma_check_02_nomal.svg',
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(controller.subtitle[index],
                        style: GlobalStyle.setTextStyle(
                            'h4', 'regular', GlobalStyle.orot_gray_darkest)),
                  ),
                ],
              ),
            ),
            Container(
              child: InkWell(
                onTap: () {
                  Get.toNamed(controller.subtitleLink[index]);
                },
                child: SvgPicture.asset(
                  'images/svg/arrow_forward.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
