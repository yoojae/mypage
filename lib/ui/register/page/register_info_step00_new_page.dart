import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_step00_new_page_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/step_bar.dart';
import 'package:orot/global_asset/global_common_dialog.dart';

//PageId :ma01000000p
class ResisterInfoStep00Page
    extends GetView<ResisterInfoStep00NewPageController> {
  const ResisterInfoStep00Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Container(
              color: GlobalStyle.orot_bg,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: AppbarTLRPadding(context),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: '본인인증',
                                      style: GlobalStyle.setTextStyle('h2',
                                          'bold', GlobalStyle.orot_black)),
                                  TextSpan(
                                      text: '정보를 넣어주세요',
                                      style: GlobalStyle.setTextStyle('h2',
                                          'regular', GlobalStyle.orot_black)),
                                ]))),
                            Container(
                              padding: EdgeInsets.only(top: 17.h),
                              child: Text(
                                '입력한 정보는 ‘마이페이지 > 개인정보 수정’에서 수정이 가능합니다.',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_darkest),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      CommonDaialog(
                                        height: 159.h,
                                        width: 312.w,
                                        buttonCount: 1,
                                        contents: '아직 회원이 아니시군요!',
                                        subcontents: '오롯 이용을 위해 가입을 진행해 주세요.',
                                      ).show();
                                    },
                                    child: Text(
                                      '신규회원이면',
                                      style: GlobalStyle.setTextStyle('h8',
                                          'regular', GlobalStyle.orot_primary,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      CommonDaialog(
                                        height: 159.h,
                                        width: 312.w,
                                        buttonCount: 1,
                                        contents: '가입된 회원이시군요!',
                                        subcontents: '오롯 이용을 위해 정보확인을 진행해 주세요.',
                                      ).show();
                                    },
                                    child: Text(
                                      '기존회원이면',
                                      style: GlobalStyle.setTextStyle('h8',
                                          'regular', GlobalStyle.orot_primary,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      CommonDaialog(
                                        height: 183.h,
                                        width: 312.w,
                                        buttonCount: 1,
                                        contents: '가입된 회원이시군요!',
                                        subcontents:
                                            '인증된 전화번호와 기존 등록된 번호가 일치하지 않습니다.본인인증을 진행해 주세요.',
                                      ).show();
                                    },
                                    child: Text(
                                      '중복회원이면',
                                      style: GlobalStyle.setTextStyle('h8',
                                          'regular', GlobalStyle.orot_primary,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
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
            '이름 입력해주세요',
            style: GlobalStyle.setTextStyle(
                'h6', 'medium', GlobalStyle.orot_gray_darkest),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: GlobalStyle.orot_gray_lightest,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: TextField(
              onChanged: (value) {
                controller.onNameChange(value);
              },
              textAlign: TextAlign.center,
              maxLength: 10,
              style: GlobalStyle.setTextStyle(
                  'h6', 'regular', GlobalStyle.orot_black),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: "본명을 입력해주세요",
                hintStyle: GlobalStyle.setTextStyle(
                    'h6', 'regular', GlobalStyle.orot_gray_dark),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 6.h),
          ),
          Text(
            '생년월일',
            style: GlobalStyle.setTextStyle(
                'h6', 'medium', GlobalStyle.orot_gray_darkest),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: GlobalStyle.orot_gray_lightest,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: TextField(
              onChanged: (value) {
                controller.onResidentNumberChange(value);
              },
              textAlign: TextAlign.center,
              maxLength: 10,
              style: GlobalStyle.setTextStyle(
                  'h6', 'regular', GlobalStyle.orot_black),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: "(YYMMDD)생일을 입력해주세요",
                hintStyle: GlobalStyle.setTextStyle(
                    'h6', 'regular', GlobalStyle.orot_gray_dark),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 6.h),
          ),
          Text(
            '전화번호',
            style: GlobalStyle.setTextStyle(
                'h6', 'medium', GlobalStyle.orot_gray_darkest),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: GlobalStyle.orot_gray_lightest,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: TextField(
              onChanged: (value) {
                controller.onPhoneNumberChange(value);
              },
              textAlign: TextAlign.center,
              maxLength: 13,
              style: GlobalStyle.setTextStyle(
                  'h6', 'regular', GlobalStyle.orot_black),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: "(010-0000-0000)전화번호를 입력해주세요",
                hintStyle: GlobalStyle.setTextStyle(
                    'h6', 'regular', GlobalStyle.orot_gray_dark),
              ),
            ),
          ),

          // 사각형 3363
        ],
      ),
    );
  }
}
