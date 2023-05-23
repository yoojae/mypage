import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/alarm_list_controller.dart';

import 'package:orot/controller/register/welcome_to_new_controller.dart';
import 'package:orot/global_asset/app_less_back.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/app_center_title.dart';

//PageId :li01010000p
class AlarmList extends GetView<AlarmListController> {
  AlarmList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppLessBack(),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: Get.width - 110.w,
                      padding: EdgeInsets.only(
                        left: 80.w,
                      ),
                      child: Text("알림",
                          style: GlobalStyle.setTextStyle(
                              'h3', 'bold', GlobalStyle.orot_black)),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'images/svg/btn_nm_setting.svg',
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(left: 27.w),
                            alignment: Alignment.centerRight,
                            height: 56,
                            child: SvgPicture.asset(
                              'images/svg/btn_all_leave_medium.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 30.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("전체",
                                style: GlobalStyle.setTextStyle('h4', 'medium',
                                    GlobalStyle.orot_gray_darker)),
                            // 사각형 3536
                            Container(
                                width: 28,
                                height: 2,
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: GlobalStyle.orot_primary))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("고위험임신",
                                style: GlobalStyle.setTextStyle('h4', 'medium',
                                    GlobalStyle.orot_gray_darker)),
                            // 사각형 3536
                            Container(
                                width: 28,
                                height: 2,
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: GlobalStyle.orot_primary))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("공지사항",
                                style: GlobalStyle.setTextStyle('h4', 'medium',
                                    GlobalStyle.orot_gray_darker)),
                            // 사각형 3536
                            Container(
                                width: 28,
                                height: 2,
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: GlobalStyle.orot_primary))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("루틴",
                                style: GlobalStyle.setTextStyle('h4', 'medium',
                                    GlobalStyle.orot_gray_darker)),
                            // 사각형 3536
                            Container(
                                width: 28,
                                height: 2,
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: GlobalStyle.orot_primary))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("MY",
                                style: GlobalStyle.setTextStyle('h4', 'medium',
                                    GlobalStyle.orot_gray_darker)),
                            // 사각형 3536
                            Container(
                                width: 28.w,
                                height: 2.h,
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: GlobalStyle.orot_gray_lighter))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("병원공지",
                                style: GlobalStyle.setTextStyle('h4', 'medium',
                                    GlobalStyle.orot_gray_darker)),
                            // 사각형 3536
                            Container(
                                width: 28,
                                height: 2,
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: GlobalStyle.orot_primary))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20.w),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("기타",
                                style: GlobalStyle.setTextStyle('h4', 'medium',
                                    GlobalStyle.orot_gray_darker)),
                            // 사각형 3536
                            Container(
                                width: 28.w,
                                height: 2.h,
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    color: GlobalStyle.orot_gray_lighter))
                          ],
                        ),
                      ),
                    ],
                  )),
              // // 알림이 없을때
              // Column(
              //   children: [
              //     Container(
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.only(top: 174.h),
              //       child: SvgPicture.asset(
              //         'images/svg/ic_nm_none.svg',
              //       ),
              //     ),
              //     Container(
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.only(top: 16.h),
              //       child: Text(
              //         '받은 알림이 없습니다.',
              //         style: GlobalStyle.setTextStyle(
              //             'h6', 'regular', GlobalStyle.orot_gray_light),
              //       ),
              //     ),
              //   ],
              // ),
              Container(padding: EdgeInsets.only(top: 26.h)),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: GlobalStyle.orot_gray_lightest),
                        child: SvgPicture.asset('images/svg/megaphone.svg',
                            fit: BoxFit.scaleDown),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Text(
                              '공지사항',
                              style: GlobalStyle.setTextStyle(
                                  'h4', 'semi_bold', GlobalStyle.orot_black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: Text(
                              '병원 진료 기록 기능이 생겼어요',
                              style: GlobalStyle.setTextStyle(
                                  'h6', 'semi_bold', GlobalStyle.orot_black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Text(
                              '있는 얼음 인생에 얼마나 가치를 이성은 싹이 구…',
                              style: GlobalStyle.setTextStyle(
                                  'h6', 'regular', GlobalStyle.orot_black),
                            ),
                          ),
                          Text(
                            '10분 전',
                            style: GlobalStyle.setTextStyle(
                                'h6', 'regular', GlobalStyle.orot_gray_lighter),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                    height: 0.5.h,
                    width: Get.width,
                    color: GlobalStyle.orot_primary,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: GlobalStyle.orot_gray_lightest),
                        child: SvgPicture.asset('images/svg/megaphone.svg',
                            fit: BoxFit.scaleDown),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Text(
                              '공지사항',
                              style: GlobalStyle.setTextStyle(
                                  'h4', 'semi_bold', GlobalStyle.orot_black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: Text(
                              '병원 진료 기록 기능이 생겼어요',
                              style: GlobalStyle.setTextStyle(
                                  'h6', 'semi_bold', GlobalStyle.orot_black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Text(
                              '있는 얼음 인생에 얼마나 가치를 이성은 싹이 구…',
                              style: GlobalStyle.setTextStyle(
                                  'h6', 'regular', GlobalStyle.orot_black),
                            ),
                          ),
                          Container(
                            width: 290.w,
                            height: 96.h,
                            margin: EdgeInsets.only(bottom: 8.h),
                            decoration: BoxDecoration(
                              color: GlobalStyle.orot_accent_dark,
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage('images/png/test.png')),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.w),
                                  topRight: Radius.circular(12)),
                            ),
                          ),
                          Text(
                            '10분 전',
                            style: GlobalStyle.setTextStyle(
                                'h6', 'regular', GlobalStyle.orot_gray_lighter),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                    height: 0.5.h,
                    width: Get.width,
                    color: GlobalStyle.orot_primary,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
