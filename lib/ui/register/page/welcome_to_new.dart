import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:orot/controller/register/welcome_to_new_controller.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/app_center_title.dart';

//PageId :li01010000p
class WelcometoNew extends GetView<WelcometoNewController> {
  WelcometoNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCenterTitle(),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: GlobalStyle.orot_bg,
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  Obx(
                    () => Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 40.h, bottom: 6.h),
                      child: Text("${controller.userName.value}님",
                          style: GlobalStyle.setTextStyle(
                              'h2', 'bold', GlobalStyle.orot_black)),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 6),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '오롯에 오신 걸 환영해요!',
                            style: GlobalStyle.setTextStyle(
                                'h2', 'regular', GlobalStyle.orot_black)),
                      ]))),
                  // 기존회원이면 밑에 줄
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 6),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '다시 오신 걸 환영해요!',
                            style: GlobalStyle.setTextStyle(
                                'h2', 'regular', GlobalStyle.orot_black)),
                      ]))),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/');
              },
              child: Container(
                margin: ButtonAllPadding(context),
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: GlobalStyle.orot_primary,
                  borderRadius: BorderRadius.circular(24.0.h),
                ),
                child: Text("오롯 시작하기",
                    style: GlobalStyle.setTextStyle(
                        'h4', 'bold', GlobalStyle.orot_white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
