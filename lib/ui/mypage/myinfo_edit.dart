import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/myinfo_controller.dart';
import 'package:orot/controller/mypage/myinfo_edit_controller.dart';
import 'package:orot/global_asset/common.dart';

import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:orot/global_asset/mypageedit_app_center.dart';
import 'package:orot/model/disease.dart';
import 'package:orot/model/unborn.dart';

//PageId :li01010000p
class MyInfoEdit extends GetView<MyInfoEditController> {
  MyInfoEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypPageEditAppCenter(
          displayName: '내 정보 확인',
          displayNameSub: '수정',
          saved: () {
            controller.saveMemeber();
            Get.toNamed('MyInfo');
          }),
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
                        Container(
                          padding: EdgeInsets.only(top: 16.h),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '오롯플러스와 함께한지',
                                  style: GlobalStyle.setTextStyle('h6',
                                      'medium', GlobalStyle.orot_gray_darkest),
                                ),
                              ),
                              Container(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // 사각형 3581
                                  _displayDay(controller.member?.day ?? 0),
                                  //_displayDay(129),
                                  Text(
                                    '일째',
                                    style: GlobalStyle.setTextStyle(
                                        'h6',
                                        'medium',
                                        GlobalStyle.orot_gray_darkest),
                                  ),
                                ],
                              ),
                              Container(
                                height: 4.h,
                              ),
                              Stack(children: [
                                Center(
                                  child: Container(
                                    height: 80.h,
                                    width: 80.w,
                                    margin: EdgeInsets.only(right: 4.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'images/png/masami.jpg')),
                                        color: GlobalStyle.orot_gray_lighter,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  left: 180.w,
                                  bottom: 10.h,
                                  child: SvgPicture.asset(
                                    'images/svg/btn_mp_profile_setting.svg',
                                  ),
                                )
                              ]),
                              Container(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'images/svg/user.svg',
                                  ),
                                  Container(width: 8.w),
                                  Text(
                                    '기본정보',
                                    style: GlobalStyle.setTextStyle(
                                        'h4',
                                        'medium',
                                        GlobalStyle.orot_gray_darkest),
                                  ),
                                ],
                              ),
                              Container(
                                height: 22.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '이름',
                                    style: GlobalStyle.setTextStyle(
                                        'h4',
                                        'regular',
                                        GlobalStyle.orot_gray_darker),
                                  ),
                                  Container(
                                    width: 96.w,
                                  ),
                                  Text(
                                    '김동국',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'regular', GlobalStyle.orot_black),
                                  ),
                                ],
                              ),
                              Container(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '생년월일',
                                    style: GlobalStyle.setTextStyle(
                                        'h4',
                                        'regular',
                                        GlobalStyle.orot_gray_darker),
                                  ),
                                  Container(
                                    width: 69.w,
                                  ),
                                  Text(
                                    '1980년 08월 25일',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'regular', GlobalStyle.orot_black),
                                  ),
                                ],
                              ),
                              Container(
                                height: 24.h,
                              ),
                              Text(
                                '휴대폰번호',
                                style: GlobalStyle.setTextStyle('h4', 'regular',
                                    GlobalStyle.orot_gray_darker),
                              ),
                              Container(
                                height: 8.h,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 18.h,
                                      bottom: 18.h,
                                      left: 16.w,
                                      right: 16.w),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      border: Border.all(
                                          color: GlobalStyle.orot_gray_lighter,
                                          width: 0.4.w),
                                      color: GlobalStyle.orot_gray_lightest),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.member?.phoneNumber ?? "",
                                        style: GlobalStyle.setTextStyle('h4',
                                            'regular', GlobalStyle.orot_black),
                                      ),
                                      SvgPicture.asset(
                                        'images/svg/arrow_forward.svg',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 24.h,
                              ),
                              buildBasicInfo(context),
                              Container(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 1.sw,
                            height: 8,
                            decoration:
                                BoxDecoration(color: const Color(0xfff5f7fa))),
                        Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'images/svg/atom.svg',
                                  ),
                                  Container(width: 8.w),
                                  Text(
                                    '진단받은 질환 정보',
                                    style: GlobalStyle.setTextStyle(
                                        'h4',
                                        'medium',
                                        GlobalStyle.orot_gray_darkest),
                                  ),
                                ],
                              ),
                              Container(
                                height: 22.h,
                              ),
                              buildDisease(context),
                              Container(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 1.sw,
                            height: 8,
                            decoration:
                                BoxDecoration(color: const Color(0xfff5f7fa))),
                        Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'images/svg/icon_babyinfo.svg',
                                  ),
                                  Container(width: 8.w),
                                  Text(
                                    '태아정보',
                                    style: GlobalStyle.setTextStyle(
                                        'h4',
                                        'medium',
                                        GlobalStyle.orot_gray_darkest),
                                  ),
                                ],
                              ),
                              Container(
                                height: 22.h,
                              ),
                              buildBabyInfo(context),
                              Container(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 1.sw,
                            height: 8,
                            decoration:
                                BoxDecoration(color: const Color(0xfff5f7fa))),
                        Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 24.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'images/svg/icon_hospital.svg',
                                  ),
                                  Container(width: 8.w),
                                  Text(
                                    '병원정보',
                                    style: GlobalStyle.setTextStyle(
                                        'h4',
                                        'medium',
                                        GlobalStyle.orot_gray_darkest),
                                  ),
                                ],
                              ),
                              Container(
                                height: 22.h,
                              ),
                              buildHospitalInfo(context),
                              Container(
                                height: 48.h,
                              ),
                            ],
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

  Widget buildBasicInfo(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '거주지 및 근로여부',
              style: GlobalStyle.setTextStyle(
                  'h4', 'regular', GlobalStyle.orot_gray_darker),
            ),
            Container(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {
                controller.to01();
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                        color: GlobalStyle.orot_gray_lighter, width: 0.4.w),
                    color: GlobalStyle.orot_gray_lightest),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '거주지',
                          style: GlobalStyle.setTextStyle(
                              'h4', 'regular', GlobalStyle.orot_gray_darker),
                        ),
                        SvgPicture.asset(
                          'images/svg/arrow_forward.svg',
                        ),
                      ],
                    ),
                    Container(
                      height: 8.h,
                    ),
                    Text(
                      controller.member?.address ?? "",
                      style: GlobalStyle.setTextStyle(
                          'h4', 'regular', GlobalStyle.orot_black),
                    ),
                    Container(
                      height: 16.h,
                    ),
                    Text(
                      '근로자',
                      style: GlobalStyle.setTextStyle(
                          'h4', 'regular', GlobalStyle.orot_gray_darker),
                    ),
                    Container(
                      height: 8.h,
                    ),
                    Text(
                      (controller.member?.isWork ?? false) ? '근로자' : '비 근로자',
                      style: GlobalStyle.setTextStyle(
                          'h4', 'regular', GlobalStyle.orot_black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildDisease(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              controller.to05();
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                      color: GlobalStyle.orot_gray_lighter, width: 0.4.w),
                  color: GlobalStyle.orot_gray_lightest),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '임신 전',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'regular', GlobalStyle.orot_gray_darker),
                      ),
                      SvgPicture.asset(
                        'images/svg/arrow_forward.svg',
                      ),
                    ],
                  ),
                  Container(
                    height: 14.h,
                  ),
                  ((controller.member?.preDisease ?? "") == "yes")
                      ? Wrap(
                          children: [
                            for (Disease disease in controller.member!.diseases!
                                .where((element) => element.type == "pre"))
                              Container(
                                width: Common.getLength(disease.name!.length),
                                margin:
                                    EdgeInsets.only(bottom: 4.h, right: 4.w),
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 8.h,
                                ),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    color: GlobalStyle.orot_primary),
                                child: Text(disease.name!,
                                    style: GlobalStyle.setTextStyle(
                                        'h7', 'bold', GlobalStyle.orot_white)),
                              ),
                          ],
                        )
                      : ((controller.member?.preDisease ?? "") == "no")
                          ? Container(
                              width: 151,
                              height: 33,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: GlobalStyle.orot_gray_lightest),
                              child: Text(
                                '진단받은 질환이 없어요',
                                style: GlobalStyle.setTextStyle(
                                    'h7', 'semi-bold', GlobalStyle.orot_black),
                              ),
                            )
                          : Container(
                              width: 151,
                              height: 33,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: GlobalStyle.orot_gray_lightest),
                              child: Text(
                                '잘 모르겠습니다ㄴ',
                                style: GlobalStyle.setTextStyle(
                                    'h7', 'semi-bold', GlobalStyle.orot_black),
                              ),
                            ),
                ],
              ),
            ),
          ),
          Container(
            height: 8.h,
          ),
          GestureDetector(
            onTap: () {
              controller.to06();
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                      color: GlobalStyle.orot_gray_lighter, width: 0.4.w),
                  color: GlobalStyle.orot_gray_lightest),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '임신 후',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'regular', GlobalStyle.orot_gray_darker),
                      ),
                      SvgPicture.asset(
                        'images/svg/arrow_forward.svg',
                      ),
                    ],
                  ),
                  Container(
                    height: 13.h,
                  ),
                  ((controller.member?.afterDisease ?? "") == "yes")
                      ? Wrap(
                          children: [
                            for (Disease disease in controller.member!.diseases!
                                .where((element) => element.type == "after"))
                              Container(
                                width: Common.getLength(disease.name!.length),
                                margin: EdgeInsets.only(
                                    top: 4.h, bottom: 4.h, right: 4.w),
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 8.h,
                                ),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    color: GlobalStyle.orot_primary),
                                child: Text(disease.name!,
                                    style: GlobalStyle.setTextStyle(
                                        'h7', 'bold', GlobalStyle.orot_white)),
                              ),
                          ],
                        )
                      : ((controller.member?.afterDisease ?? "") == "no")
                          ? Container(
                              width: 151,
                              height: 33,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: GlobalStyle.orot_gray_lightest),
                              child: Text(
                                '진단받은 질환이 없어요',
                                style: GlobalStyle.setTextStyle(
                                    'h7', 'semi-bold', GlobalStyle.orot_black),
                              ),
                            )
                          : Container(
                              width: 151,
                              height: 33,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: GlobalStyle.orot_gray_lightest),
                              child: Text(
                                '잘 모르겠습니다',
                                style: GlobalStyle.setTextStyle(
                                    'h7', 'semi-bold', GlobalStyle.orot_black),
                              ),
                            ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBabyInfo(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '임신경험 및 유산경험',
              style: GlobalStyle.setTextStyle(
                  'h4', 'regular', GlobalStyle.orot_gray_darker),
            ),
          ],
        ),
        Container(
          height: 8.h,
        ),
        ((controller.member?.deliver ?? 'primipara') == 'primipara')
            ? GestureDetector(
                onTap: () {
                  controller.to02();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 18.h, bottom: 18.h, left: 16.w, right: 16.w),
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                          color: GlobalStyle.orot_gray_lighter, width: 0.4.w),
                      color: GlobalStyle.orot_gray_lightest),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '초산',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'regular', GlobalStyle.orot_black),
                      ),
                      SvgPicture.asset(
                        'images/svg/arrow_forward.svg',
                      ),
                    ],
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  controller.to02();
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                          color: GlobalStyle.orot_gray_lighter, width: 0.4.w),
                      color: GlobalStyle.orot_gray_lightest),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '임신경험',
                            style: GlobalStyle.setTextStyle(
                                'h4', 'regular', GlobalStyle.orot_gray_darker),
                          ),
                          SvgPicture.asset(
                            'images/svg/arrow_forward.svg',
                          ),
                        ],
                      ),
                      Container(
                        height: 8.h,
                      ),
                      Text(
                        '경산',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'regular', GlobalStyle.orot_black),
                      ),
                      Container(
                        height: 16.h,
                      ),
                      Text(
                        '유산경험',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'regular', GlobalStyle.orot_gray_darker),
                      ),
                      Container(
                        height: 8.h,
                      ),
                      Text(
                        !(controller.member?.isMiscarriage == false)
                            ? '유산 경험 없음'
                            : '유산 경험 있음', // '유산경
                        style: GlobalStyle.setTextStyle(
                            'h4', 'regular', GlobalStyle.orot_black),
                      ),
                    ],
                  ),
                ),
              ),
        Container(
          height: 24.h,
        ),
        Text(
          '단태아/다태아',
          style: GlobalStyle.setTextStyle(
              'h4', 'regular', GlobalStyle.orot_gray_darker),
        ),
        Container(
          height: 8.h,
        ),
        GestureDetector(
          onTap: () {
            controller.to03();
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 18.h, bottom: 18.h, left: 16.w, right: 16.w),
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                    color: GlobalStyle.orot_gray_lighter, width: 0.4.w),
                color: GlobalStyle.orot_gray_lightest),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (controller.member?.unborns?.length ?? 1) == 1
                      ? "단태아   "
                      : "다태아 ",
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_black),
                ),
                SvgPicture.asset(
                  'images/svg/arrow_forward.svg',
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 24.h,
        ),
        Row(
          children: [
            Text(
              '태명 및 출산 예정일',
              style: GlobalStyle.setTextStyle(
                  'h4', 'regular', GlobalStyle.orot_gray_darker),
            ),
          ],
        ),
        Container(
          height: 8.h,
        ),
        GestureDetector(
          onTap: () {
            controller.to04();
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                    color: GlobalStyle.orot_gray_lighter, width: 0.4.w),
                color: GlobalStyle.orot_gray_lightest),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '태명',
                      style: GlobalStyle.setTextStyle(
                          'h4', 'regular', GlobalStyle.orot_gray_darker),
                    ),
                    SvgPicture.asset(
                      'images/svg/arrow_forward.svg',
                    ),
                  ],
                ),
                Container(
                  height: 8.h,
                ),
                // 여기서 태아명은 무조건 2열로요..왼쪽 정렬...컨테이너 사이즈는 어찌 하나요. 질환처럼 해야하나
                Wrap(
                  children: [
                    for (Unborn unborn in controller.member!.unborns!)
                      Container(
                        width: Common.getLength(unborn.unbornBabyName!.length),
                        margin:
                            EdgeInsets.only(top: 4.h, bottom: 4.h, right: 4.w),
                        padding: EdgeInsets.only(
                          top: 8.h,
                          bottom: 8.h,
                        ),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: GlobalStyle.orot_primary),
                        child: Text(unborn.unbornBabyName ?? "",
                            style: GlobalStyle.setTextStyle(
                                'h7', 'bold', GlobalStyle.orot_white)),
                      ),
                  ],
                ),
                Container(
                  height: 16.h,
                ),
                Text(
                  '출산 예정일',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_gray_darker),
                ),
                Container(
                  height: 8.h,
                ),
                Text(
                  Common.getKoreanDateString(
                      controller.member?.unborns?[0].dueDate ?? ""),
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_black),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildHospitalInfo(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '내 병원',
            style: GlobalStyle.setTextStyle(
                'h4', 'regular', GlobalStyle.orot_gray_darkest),
          ),
          Container(
            height: 24.h,
          ),
          Container(
            height: 70.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: GlobalStyle.orot_gray_lightest),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/svg/ic_mp_add.svg',
                ),
                Container(
                  height: 6.h,
                ),
                Text(
                  '내 병원 등록하기',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'medium', GlobalStyle.orot_gray_darker),
                ),
              ],
            ),
          ),
          Container(
            height: 24.h,
          ),
          Container(
            height: 70.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: GlobalStyle.orot_gray_lightest),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/svg/ic_mp_add.svg',
                ),
                Container(
                  height: 6.h,
                ),
                Text(
                  '내 인근 병원 및 보건소 찾기',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'medium', GlobalStyle.orot_gray_darker),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayDay(int days) {
    String dayString = days.toString();
    return Row(
      children: [
        for (int i = 0; i < dayString.length; i++)
          Container(
            height: 24.h,
            width: 24.w,
            margin: EdgeInsets.only(right: 4.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: GlobalStyle.orot_gray_lightest, shape: BoxShape.circle),
            child: Text(
              dayString[i],
              style: GlobalStyle.setTextStyle(
                  'h5', 'bold', GlobalStyle.orot_primary),
            ),
          ),
      ],
    );
  }

  void setState(Null Function() param0) {}
}
