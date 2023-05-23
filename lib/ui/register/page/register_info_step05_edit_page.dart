import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_step05_edit_page_controller.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/model/disease.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<String> disease = <String>[
  '조기진통',
  '분만관련 출혈',
  '중증 임신중독증',
  '양막의 조기파열',
  '태반조기박리'
];

//PageId :ma03010500p
class ResisterInfoStep05EditPage
    extends GetView<ResisterInfoStep05EditPageController> {
  ResisterInfoStep05EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: GlobalStyle.orot_bg,
        height: Get.height,
        child: Obx(
          () => SafeArea(
            child: Column(
              children: [
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
                                              text: '임신 전 진단받은 질환',
                                              style: GlobalStyle.setTextStyle(
                                                  'h2',
                                                  'bold',
                                                  GlobalStyle.orot_black)),
                                          TextSpan(
                                              text: '이 있나요?',
                                              style: GlobalStyle.setTextStyle(
                                                  'h2',
                                                  'regular',
                                                  GlobalStyle.orot_black)),
                                        ]))),
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
                              margin: EdgeInsets.only(
                                  top: 196.h,
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
                )
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
          GestureDetector(
            onTap: () {
              controller.setDisease();
            },
            child: Container(
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.isDisease.value
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '진단받은 질환이 있어요',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
          controller.isDisease.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.h, bottom: 8.h),
                      child: Text(
                        '해당하는 질환을 모두 선택해 주세요.',
                        style: GlobalStyle.setTextStyle(
                            'h8', 'regular', GlobalStyle.orot_gray_darkest),
                      ),
                    ),
                    Wrap(
                      children: [
                        for (Disease disease in controller.list)
                          GestureDetector(
                            onTap: () {
                              controller.checkDisease(disease.id);
                            },
                            child: Container(
                              width: Common.getLength(disease.name!.length),
                              margin: EdgeInsets.only(
                                  top: 4.h, bottom: 4.h, right: 4.w),
                              padding: EdgeInsets.only(
                                top: 8.h,
                                bottom: 8.h,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  color: (disease.isSelected ?? false)
                                      ? GlobalStyle.orot_primary
                                      : GlobalStyle.orot_gray_lightest),
                              child: Text(disease.name!,
                                  style: GlobalStyle.setTextStyle(
                                      'h7',
                                      (disease.isSelected ?? false)
                                          ? 'bold'
                                          : 'regular',
                                      (disease.isSelected ?? false)
                                          ? GlobalStyle.orot_white
                                          : GlobalStyle.orot_gray_darker)),
                            ),
                          ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 24.h),
                    )
                  ],
                )
              : Container(),
          GestureDetector(
            onTap: () {
              controller.setNotDisease();
            },
            child: Container(
              height: 48.h,
              margin: EdgeInsets.only(top: 8.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.isNotDisease.value
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '진단받은 질환이 없어요',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.setUnkownDisease();
            },
            child: Container(
              height: 48.h,
              margin: EdgeInsets.only(top: 8.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.isUnkownDisease.value
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '모르겠어요',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget diseaseBuilder() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: disease.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                EdgeInsets.only(top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: GlobalStyle.orot_gray_lightest),
            child: Text(disease[index],
                style: GlobalStyle.setTextStyle(
                    'h7', 'regular', GlobalStyle.orot_gray_darker)),
          );
        });
  }
}
