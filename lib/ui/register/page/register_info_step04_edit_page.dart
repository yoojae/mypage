import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_step04_edit_page_controller.dart';

import 'package:orot/global_asset/bottom_calendar.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

//PageId :ma03010400p
class ResisterInfoStep04EditPage
    extends GetView<ResisterInfoStep04EditPageController> {
  ResisterInfoStep04EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        color: GlobalStyle.orot_bg,
        child: Obx(
          () => SafeArea(
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 20.w),
                  alignment: Alignment.centerRight,
                  height: 56,
                  child: SvgPicture.asset(
                    'images/svg/btn_all_leave_medium.svg',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: Get.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 24.h, left: 20.w, right: 20.w),
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: '태명',
                                            style: GlobalStyle.setTextStyle(
                                                'h2',
                                                'bold',
                                                GlobalStyle.orot_black)),
                                        TextSpan(
                                            text: '과',
                                            style: GlobalStyle.setTextStyle(
                                                'h2',
                                                'regular',
                                                GlobalStyle.orot_black)),
                                        TextSpan(
                                            text: ' 출산예정일',
                                            style: GlobalStyle.setTextStyle(
                                                'h2',
                                                'bold',
                                                GlobalStyle.orot_black)),
                                        TextSpan(
                                            text: '을',
                                            style: GlobalStyle.setTextStyle(
                                                'h2',
                                                'regular',
                                                GlobalStyle.orot_black)),
                                      ]))),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(top: 6.h),
                                    child: Text('입력해 주세요',
                                        style: GlobalStyle.setTextStyle('h2',
                                            'regular', GlobalStyle.orot_black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 17.h),
                                    child: Text(
                                      '입력한 정보는 ‘마이페이지 > 개인정보 수정’에서 수정이 가능합니다.',
                                      style: GlobalStyle.setTextStyle(
                                          'h8',
                                          'regular',
                                          GlobalStyle.orot_gray_darkest),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            buildResisterInfoStep03View(context)
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.isCanNextButton.value) {
                              controller.toNext();
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 110.h,
                                bottom: 48.h,
                                left: 20.w,
                                right: 20.w),
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
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildResisterInfoStep03View(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48.h, left: 20.w, right: 20.w),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '태명 입력',
            style: GlobalStyle.setTextStyle(
                'h6', 'medium', GlobalStyle.orot_gray_darkest),
          ),
          controller.babyCount.value == 1
              ? Container(
                  margin: EdgeInsets.only(top: 8.h),
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24.h)),
                      color: GlobalStyle.orot_gray_lightest),
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]')),
                    ],
                    focusNode: controller.textFocus,
                    onChanged: (value) {
                      controller.setUnBornBabyName(0, value);
                    },
                    textAlign: TextAlign.center,
                    maxLength: 10,
                    style: GlobalStyle.setTextStyle(
                        'h6', 'regular', GlobalStyle.orot_black),
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: "태명을 입력하세요",
                      hintStyle: GlobalStyle.setTextStyle(
                          'h6', 'medium', GlobalStyle.orot_gray_dark),
                    ),
                  ),
                )
              : //다대아일 경우 2명이 기본 추가
              muitiBabys(),
          Container(
            padding: EdgeInsets.only(top: 11.h),
            child: Text(
              '✓ 한글 영문 10자까지 입력 가능',
              style: GlobalStyle.setTextStyle(
                  'h12', 'regular', GlobalStyle.orot_gray_darker),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 7.h),
            child: Text(
              '✓ 특수문자 사용 불가',
              style: GlobalStyle.setTextStyle(
                  'h12', 'regular', GlobalStyle.orot_gray_darker),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
            child: Text(
              '출산예정일 선택',
              style: GlobalStyle.setTextStyle(
                  'h6', 'medium', GlobalStyle.orot_gray_darkest),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.foucsOut();
              const BottomCalender().showLongHeightModalBottomSheet(
                  context, controller.setDueDate);
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: GlobalStyle.orot_gray_lightest,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Text(controller.choiceDate.value,
                  style: GlobalStyle.setTextStyle(
                      'h6',
                      'medium',
                      controller.choiceDate.value == "출산 예정일을 선택하세요"
                          ? GlobalStyle.orot_gray_dark
                          : GlobalStyle.orot_black)),
            ),
          ),
        ],
      ),
    );
  }

  Widget muitiBabys() {
    return Column(
      children: [
        for (int i = 0; i < controller.babyCount.value ~/ 2; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h),
                width: 156.w,
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.h)),
                    color: GlobalStyle.orot_gray_lightest),
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(
                        r'[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]')),
                  ],
                  focusNode: controller.textFocusList[(i * 2)],
                  onChanged: (value) {
                    int index = (i * 2);
                    controller.setUnBornBabyName(index, value);
                  },
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  style: GlobalStyle.setTextStyle(
                      'h6', 'regular', GlobalStyle.orot_black),
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: "태명을 입력하세요",
                    hintStyle: GlobalStyle.setTextStyle(
                        'h6', 'regular', GlobalStyle.orot_gray_dark),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.h),
                width: 156.w,
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.h)),
                    color: GlobalStyle.orot_gray_lightest),
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(
                        r'[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]')),
                  ],
                  focusNode: controller.textFocusList[(i * 2) + 1],
                  onChanged: (value) {
                    int index = (i * 2) + 1;
                    controller.setUnBornBabyName(index, value);
                  },
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  style: GlobalStyle.setTextStyle(
                      'h6', 'regular', GlobalStyle.orot_black),
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: "태명을 입력하세요",
                    hintStyle: GlobalStyle.setTextStyle(
                        'h6', 'regular', GlobalStyle.orot_gray_dark),
                  ),
                ),
              )
            ],
          ),
        (controller.babyCount.value ~/ 2 != controller.babyCount.value / 2)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    width: 156.w,
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.h)),
                        color: GlobalStyle.orot_gray_lightest),
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(
                            r'[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]')),
                      ],
                      focusNode: controller.textFocus,
                      onChanged: (value) {
                        controller.setUnBornBabyName(
                            controller.babyCount.value - 1, value);
                      },
                      textAlign: TextAlign.center,
                      maxLength: 10,
                      style: GlobalStyle.setTextStyle(
                          'h6', 'regular', GlobalStyle.orot_black),
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: "태명을 입력하세요",
                        hintStyle: GlobalStyle.setTextStyle(
                            'h6', 'regular', GlobalStyle.orot_gray_dark),
                      ),
                    ),
                  )
                ],
              )
            : Container()
      ],
    );
  }
}
