import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/myinfo_controller.dart';
import 'package:orot/global_asset/mypage_app_center.dart';
import 'package:orot/global_asset/global_style.dart';

import '../../global_asset/common.dart';
import '../../model/disease.dart';
import '../../model/unborn.dart';

//PageId :li01010000p
class MyInfo extends GetView<MyInfoController> {
  MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypPageAppCenter(
        displayName: '내 정보 확인',
        displayNameSub: '수정',
        gotoMember: () {
          controller.toEdit();
        },
      ),
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
                              Container(
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
                              Container(
                                height: 8.h,
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
                        buildDisease(context),
                        Container(
                            width: 1.sw,
                            height: 8,
                            decoration:
                                BoxDecoration(color: const Color(0xfff5f7fa))),
                        buildBabyInfo(context),
                        Container(
                            width: 1.sw,
                            height: 8,
                            decoration:
                                BoxDecoration(color: const Color(0xfff5f7fa))),
                        buildHospitalInfo(context)
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
        padding: EdgeInsets.only(
          top: 48.h,
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
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
                      'h4', 'medium', GlobalStyle.orot_gray_darkest),
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
                      'h4', 'regular', GlobalStyle.orot_gray_darker),
                ),
                Container(
                  width: 96.w,
                ),
                Text(
                  controller.member?.name ?? "",
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_black),
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
                      'h4', 'regular', GlobalStyle.orot_gray_darker),
                ),
                Container(
                  width: 69.w,
                ),
                Text(
                  Common.birthDay(controller.member?.residentNumber ?? ""),
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_black),
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
                  '휴대폰번호',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_gray_darker),
                ),
                Container(
                  width: 55.w,
                ),
                Text(
                  controller.member?.phoneNumber ?? "",
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_black),
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
                  '거주지',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_gray_darker),
                ),
                Container(
                  width: 84.w,
                ),
                Text(
                  controller.member?.address ?? "",
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_black),
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
                  '근로여부',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_gray_darker),
                ),
                Container(
                  width: 69.w,
                ),
                Text(
                  (controller.member?.isWork ?? false) ? '근로자' : '비근로자',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_black),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildDisease(BuildContext context) {
    return Container(
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
                    'h4', 'medium', GlobalStyle.orot_gray_darkest),
              ),
            ],
          ),
          Container(
            height: 22.h,
          ),
          Text(
            '임신 전',
            style: GlobalStyle.setTextStyle(
                'h4', 'regular', GlobalStyle.orot_gray_darker),
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
                            EdgeInsets.only(top: 4.h, bottom: 4.h, right: 4.w),
                        padding: EdgeInsets.only(
                          top: 8.h,
                          bottom: 8.h,
                        ),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: GlobalStyle.orot_gray_lightest),
                      child: Text(
                        '몰라요',
                        style: GlobalStyle.setTextStyle(
                            'h7', 'semi-bold', GlobalStyle.orot_black),
                      ),
                    ),
          Container(
            height: 22.h,
          ),
          Text(
            '임신 후',
            style: GlobalStyle.setTextStyle(
                'h4', 'regular', GlobalStyle.orot_gray_darker),
          ),
          Container(
            height: 14.h,
          ),
          ((controller.member?.afterDisease ?? "") == "yes")
              ? Wrap(
                  children: [
                    for (Disease disease in controller.member!.diseases!
                        .where((element) => element.type == "after"))
                      Container(
                        width: Common.getLength(disease.name!.length),
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
                          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: GlobalStyle.orot_gray_lightest),
                      child: Text(
                        '몰라요',
                        style: GlobalStyle.setTextStyle(
                            'h7', 'semi-bold', GlobalStyle.orot_black),
                      ),
                    ),
          Container(
            height: 24.h,
          ),
        ],
      ),
    );
  }

  Widget buildBabyInfo(BuildContext context) {
    return Container(
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
                    'h4', 'medium', GlobalStyle.orot_gray_darkest),
              ),
            ],
          ),
          Container(
            height: 22.h,
          ),
          Row(
            children: [
              Text(
                '임신경험',
                style: GlobalStyle.setTextStyle(
                    'h4', 'regular', GlobalStyle.orot_gray_darker),
              ),
              Container(
                width: 69.w,
              ),
              Text(
                (controller.member?.deliver ?? 'primipara') == 'primipara'
                    ? "  초산  "
                    : "  경산  ",
                style: GlobalStyle.setTextStyle(
                    'h4', 'regular', GlobalStyle.orot_black),
              ),
              Container(
                width: 28.w,
              ),
              // 경산일 경우 이걸 누루면 하단에 유산경험 없음 / 또는 있음으로 나와야 함
              ((controller.member?.deliver ?? 'primipara') == 'primipara')
                  ? Container()
                  : Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: SvgPicture.asset(
                        'images/svg/ic_mp_arrow_bottom.svg',
                      ),
                    ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 21.h,
              ),
              ((controller.member?.deliver ?? 'primipara') == 'primipara')
                  ? Container()
                  : Container(
                      width: 96,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: GlobalStyle.orot_gray_lightest,
                      ),
                      child: Text(
                        !(controller.member?.isMiscarriage == false)
                            ? '유산 경험 없음'
                            : '유산 경험 있음', // '유산경험 있음'
                        style: GlobalStyle.setTextStyle(
                            'h7', 'medium', GlobalStyle.orot_gray_darkest),
                      ),
                    )
            ],
          ),
          Container(
            height: 24.h,
          ),
          Row(
            children: [
              Text(
                '단태아/다태아',
                style: GlobalStyle.setTextStyle(
                    'h4', 'regular', GlobalStyle.orot_gray_darker),
              ),
              Container(
                width: 69.w,
              ),
              Text(
                (controller.member?.unborns?.length ?? 1) == 1
                    ? "단태아  "
                    : "다태아  ",
                style: GlobalStyle.setTextStyle(
                    'h4', 'regular', GlobalStyle.orot_black),
              ),
            ],
          ),
          Container(
            height: 24.h,
          ),
          Text(
            '태명',
            style: GlobalStyle.setTextStyle(
                'h4', 'regular', GlobalStyle.orot_gray_darker),
          ),
          Container(
            height: 14.h,
          ),
          Wrap(
            children: [
              for (Unborn unborn in controller.member!.unborns!)
                Container(
                  width: Common.getLength(unborn.unbornBabyName!.length),
                  margin: EdgeInsets.only(top: 4.h, bottom: 4.h, right: 4.w),
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
            height: 22.h,
          ),
          Row(
            children: [
              Text(
                '출산예정일',
                style: GlobalStyle.setTextStyle(
                    'h4', 'regular', GlobalStyle.orot_gray_darker),
              ),
              Container(
                width: 55.w,
              ),
              Text(
                Common.getKoreanDateString(
                    controller.member?.unborns?[0].dueDate ?? ""),
                style: GlobalStyle.setTextStyle(
                    'h4', 'regular', GlobalStyle.orot_black),
              ),
            ],
          ),
          Container(
            height: 14.h,
          ),
          Container(
            height: 24.h,
          ),
        ],
      ),
    );
  }

  Widget buildHospitalInfo(BuildContext context) {
    return Container(
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
                    'h4', 'medium', GlobalStyle.orot_gray_darkest),
              ),
            ],
          ),
          Container(
            height: 22.h,
          ),
          Text(
            '내 병원',
            style: GlobalStyle.setTextStyle(
                'h4', 'regular', GlobalStyle.orot_gray_darkest),
          ),
          Container(
            height: 24.h,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('RegisterMyHospital');
            },
            child: Container(
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
          Container(
            height: 48.h,
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
}

void setState(Null Function() param0) {}
