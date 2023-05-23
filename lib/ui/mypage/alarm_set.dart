import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/alarm_list_controller.dart';
import 'package:orot/controller/mypage/alarm_set_controller.dart';
import 'package:orot/controller/mypage/alarm_view_controller.dart';

import 'package:orot/controller/register/welcome_to_new_controller.dart';
import 'package:orot/global_asset/app_less_back.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:flutter_switch/flutter_switch.dart';

//PageId :li01010000p
class AlarmSet extends GetView<AlarmSetController> {
  AlarmSet({Key? key}) : super(key: key);
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCenterTitle(
        displayName: '알림 설정',
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            color: GlobalStyle.orot_bg,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('전체 알림 받지 않기',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              FlutterSwitch(
                                width: 32.0.w,
                                height: 18.0.h,
                                toggleSize: 14.0,
                                value: status,
                                borderRadius: 30.0,
                                showOnOff: false,
                                activeColor: GlobalStyle.orot_primary,
                                inactiveColor: GlobalStyle.orot_gray_lighter,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('오롯플러스에서 발송하는 알림을 모두 수신하지 않습니다',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                      // 긴급알람메세지는 전체 알림받지 않기에서 빠집지나..무조건 수동설정
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('긴급메시지 알림',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              FlutterSwitch(
                                width: 32.0.w,
                                height: 18.0.h,
                                toggleSize: 14.0,
                                value: status,
                                borderRadius: 30.0,
                                showOnOff: false,
                                activeColor: GlobalStyle.orot_primary,
                                inactiveColor: GlobalStyle.orot_gray_lighter,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('긴급메시지 알림을 수신합니다',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('방해 금지 모드',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              FlutterSwitch(
                                width: 32.0.w,
                                height: 18.0.h,
                                toggleSize: 14.0,
                                value: status,
                                borderRadius: 30.0,
                                showOnOff: false,
                                activeColor: GlobalStyle.orot_primary,
                                inactiveColor: GlobalStyle.orot_gray_lighter,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('방해 금지 시간대를 설정합니다',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'images/svg/ic_ma_radio_pressed.svg'),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 8.w,
                                        ),
                                        child: Text(
                                          '30분',
                                          style: GlobalStyle.setTextStyle('h4',
                                              'medium', GlobalStyle.orot_black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(left: 48.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'images/svg/ic_ma_radio_pressed.svg'),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 8.w,
                                        ),
                                        child: Text(
                                          '1시간',
                                          style: GlobalStyle.setTextStyle('h4',
                                              'medium', GlobalStyle.orot_black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(left: 48.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'images/svg/ic_ma_radio_pressed.svg'),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 8.w,
                                        ),
                                        child: Text(
                                          '2시간',
                                          style: GlobalStyle.setTextStyle('h4',
                                              'medium', GlobalStyle.orot_black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'images/svg/ic_ma_radio_pressed.svg'),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 8.w,
                                        ),
                                        child: Text(
                                          '6시간',
                                          style: GlobalStyle.setTextStyle('h4',
                                              'medium', GlobalStyle.orot_black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(left: 48.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'images/svg/ic_ma_radio_pressed.svg'),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 8.w,
                                        ),
                                        child: Text(
                                          '12시간',
                                          style: GlobalStyle.setTextStyle('h4',
                                              'medium', GlobalStyle.orot_black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'images/svg/ic_ma_radio_pressed.svg'),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 8.w,
                                        ),
                                        child: Text(
                                          '방해 금지 시간 직접 설정하기',
                                          style: GlobalStyle.setTextStyle('h4',
                                              'medium', GlobalStyle.orot_black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(top: 8.h, right: 24.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.transparent,
                                      style: BorderStyle.solid,
                                      width: 0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                      'images/svg/ic_nm_check_02_nomal.svg'),
                                  Container(
                                    width: 8.w,
                                  ),
                                  Text(
                                    '매일 반복',
                                    style: GlobalStyle.setTextStyle(
                                        'h8', 'medium', GlobalStyle.orot_black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                          ),
                          // 사각형 3594
                          Container(
                            height: 40.h,
                            padding: EdgeInsets.only(
                                top: 12.h,
                                bottom: 12.h,
                                left: 16.w,
                                right: 16.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: GlobalStyle.orot_gray_lightest),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '시작시간',
                                  style: GlobalStyle.setTextStyle('h6',
                                      'regular', GlobalStyle.orot_gray_darker),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '오후 10:00',
                                      style: GlobalStyle.setTextStyle(
                                          'h6',
                                          'regular',
                                          GlobalStyle.orot_gray_dark),
                                    ),
                                    Container(
                                      width: 16.w,
                                    ),
                                    SvgPicture.asset(
                                        'images/svg/btn_nm_shortcut_long_impressed.svg'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 12.h),
                          ),

                          Container(
                            height: 40.h,
                            padding: EdgeInsets.only(
                                top: 12.h,
                                bottom: 12.h,
                                left: 16.w,
                                right: 16.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: GlobalStyle.orot_gray_lightest),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '종료시간',
                                  style: GlobalStyle.setTextStyle('h6',
                                      'regular', GlobalStyle.orot_gray_darker),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '오전 09:00',
                                      style: GlobalStyle.setTextStyle(
                                          'h6',
                                          'regular',
                                          GlobalStyle.orot_gray_dark),
                                    ),
                                    Container(
                                      width: 16.w,
                                    ),
                                    SvgPicture.asset(
                                        'images/svg/btn_nm_shortcut_long_impressed.svg'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 12.h),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 24.w),
                            alignment: Alignment.centerRight,
                            child: Text("설정한 시간동안 알림을 받지 않습니다",
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 사각형 3567
                Container(
                    margin: EdgeInsets.only(top: 24.h),
                    height: 8,
                    decoration:
                        BoxDecoration(color: GlobalStyle.orot_gray_lightest)),
                Container(
                  padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('고위험 알림',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              FlutterSwitch(
                                width: 32.0.w,
                                height: 18.0.h,
                                toggleSize: 14.0,
                                value: status,
                                borderRadius: 30.0,
                                showOnOff: false,
                                activeColor: GlobalStyle.orot_primary,
                                inactiveColor: GlobalStyle.orot_gray_lighter,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('고위험 알림 설명 고위험 알림 설명',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('공지사항',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              FlutterSwitch(
                                width: 32.0.w,
                                height: 18.0.h,
                                toggleSize: 14.0,
                                value: status,
                                borderRadius: 30.0,
                                showOnOff: false,
                                activeColor: GlobalStyle.orot_primary,
                                inactiveColor: GlobalStyle.orot_gray_lighter,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('공지사항 알림 설명 공지사항 알림 설명',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('루틴',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: SvgPicture.asset(
                                      'images/svg/arrow_forward.svg')),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('루틴 알림 설명 루틴 알림 설명',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('MY',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: SvgPicture.asset(
                                      'images/svg/arrow_forward.svg')),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('마이 알림 설명 마이 알림 설명',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('병원정보',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              FlutterSwitch(
                                width: 32.0.w,
                                height: 18.0.h,
                                toggleSize: 14.0,
                                value: status,
                                borderRadius: 30.0,
                                showOnOff: false,
                                activeColor: GlobalStyle.orot_primary,
                                inactiveColor: GlobalStyle.orot_gray_lighter,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('병원정보 알림 설명 병원정보 알림 설명',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 24.h),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('기타',
                                    style: GlobalStyle.setTextStyle('h4',
                                        'semi_bold', GlobalStyle.orot_black)),
                              ),
                              FlutterSwitch(
                                width: 32.0.w,
                                height: 18.0.h,
                                toggleSize: 14.0,
                                value: status,
                                borderRadius: 30.0,
                                showOnOff: false,
                                activeColor: GlobalStyle.orot_primary,
                                inactiveColor: GlobalStyle.orot_gray_lighter,
                                onToggle: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.h),
                            alignment: Alignment.centerLeft,
                            child: Text('기타 알림 설명 기타 알림 설명',
                                style: GlobalStyle.setTextStyle('h8', 'regular',
                                    GlobalStyle.orot_gray_dark)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
