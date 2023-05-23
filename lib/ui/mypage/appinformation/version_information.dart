import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/version_information_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';

import 'package:orot/global_asset/mypage_app_center.dart';

import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';

//PageId :li01010000p
class VersionInformation extends GetView<VersionInformationController> {
  VersionInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyle.orot_bg,
      appBar: AppCenterTitle(
        displayName: '버전 정보',
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                Container(height: 100.h,),
                Text('Orot+',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: GlobalStyle.orot_primary,
                    fontFamily: 'Pretendard',
                    letterSpacing: -0.5.w,),
                ),
                Container(height: 16.h,),
                Text('현재 버전 1.0.0',
                  style: GlobalStyle.setTextStyle('h4', 'medium', GlobalStyle.orot_black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}