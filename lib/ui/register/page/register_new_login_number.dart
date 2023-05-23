import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_New_login_number_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/app_less_back.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

//PageId :li01010000p
class ResisterNewLoginNumber extends GetView<ResisterNewLoginNumberController> {
  ResisterNewLoginNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppLessBack(),
      body: Obx(
        () => SafeArea(
          bottom: false,
          child: Container(
            color: GlobalStyle.orot_bg,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 40.h, bottom: 6.h),
                        child: Text("오롯에서 사용할",
                            style: GlobalStyle.setTextStyle(
                                'h2', 'regular', GlobalStyle.orot_black)),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 6),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '비밀번호를 설정',
                                style: GlobalStyle.setTextStyle(
                                    'h2', 'bold', GlobalStyle.orot_black)),
                            TextSpan(
                                text: '하세요',
                                style: GlobalStyle.setTextStyle(
                                    'h2', 'regular', GlobalStyle.orot_black)),
                          ]))),
                      Container(
                        padding: EdgeInsets.only(bottom: 74.h),
                      ),
                    ],
                  ),
                ),
                BuildNumberPad(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget BuildNumberPad(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: 56.w, right: 56.w),
            height: 24.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < 4; i++)
                  controller.passwordValue.value.length > i
                      ? Container(
                          height: 24.h,
                          width: 40.w,
                          child: Column(
                            children: [
                              Container(
                                height: 22.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                    color: GlobalStyle.orot_primary,
                                    shape: BoxShape.circle),
                              )
                            ],
                          ),
                        )
                      : Container(
                          height: 24.h,
                          width: 40.w,
                          child: Column(
                            children: [
                              Container(
                                height: 22.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                height: 1.6.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: GlobalStyle.orot_gray_light),
                              ),
                            ],
                          ),
                        ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            height: 284.h,
            color: GlobalStyle.orot_gray_lightest,
            child: Wrap(
              children: [
                for (int i = 0; i < 9; i++)
                  GestureDetector(
                    onTap: () {
                      controller
                          .setPassword(controller.numberList[i].toString());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 119.w,
                      height: 71.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: GlobalStyle.orot_gray_lightest)),
                      child: Text(controller.numberList[i].toString(),
                          style: TextStyle(
                            fontFamily: 'SUIT_Medium',
                            fontSize: 30,
                          )),
                    ),
                  ),
                Container(
                  alignment: Alignment.center,
                  width: 119.w,
                  height: 71.h,
                  child: Text('',
                      style: TextStyle(
                        fontFamily: 'SUIT_Medium',
                        fontSize: 30,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setPassword(controller.numberList[9].toString());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 119.w,
                    height: 71.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: GlobalStyle.orot_gray_lightest)),
                    child: Text(controller.numberList[9].toString(),
                        style: TextStyle(
                          fontFamily: 'SUIT_Medium',
                          fontSize: 30,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setDelPassword();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 119.w,
                    height: 71.h,
                    child: SvgPicture.asset('images/svg/ic_ma_backspace.svg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
