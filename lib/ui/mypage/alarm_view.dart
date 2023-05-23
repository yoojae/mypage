import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/alarm_list_controller.dart';
import 'package:orot/controller/mypage/alarm_view_controller.dart';

import 'package:orot/controller/register/welcome_to_new_controller.dart';
import 'package:orot/global_asset/app_less_back.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/app_center_title.dart';

//PageId :li01010000p
class AlarmView extends GetView<AlarmViewController> {
  AlarmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCenterTitle(),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: GlobalStyle.orot_bg,
          padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('알림제목',
                    style: GlobalStyle.setTextStyle(
                        'h3', 'semi_bold', GlobalStyle.orot_black)),
              ),
              Container(
                padding: EdgeInsets.only(top: 8.h),
                alignment: Alignment.centerLeft,
                child: Text('2023.05.29',
                    style: GlobalStyle.setTextStyle(
                        'h8', 'regular', GlobalStyle.orot_gray_darker)),
              ),
              Container(
                  height: 2.h,
                  margin: EdgeInsets.only(
                    top: 16.h,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                      color: GlobalStyle.orot_gray_lighter)),
              Container(
                width: 320.w,
                margin: EdgeInsets.only(top: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Container(
                  child: Image.asset(
                    'images/png/test2.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.h),
                alignment: Alignment.centerLeft,
                child: Text(
                    '전 시즌 기본연봉 4억 3000만 원, 옵션 1억 5000만 원으로 A등급에 속한 박정아를 영입한 페퍼저축은행은 한국배구연맹 자유계약 선수관리규정에 따라 한국도로공사에 연봉(4억 3000만 원)의 200%인 8억 6000만 원과 FA 보상 선수를 보상해야 한다. ',
                    style: GlobalStyle.setTextStyle(
                        'h6', 'regular', GlobalStyle.orot_gray_darkest,
                        height: 1.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
