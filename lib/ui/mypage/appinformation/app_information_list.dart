import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/app_information_list_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';

import 'package:orot/global_asset/mypage_app_center.dart';

import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';

//PageId :li01010000p
class AppInformationList extends GetView<AppInformationListController> {
  AppInformationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyle.orot_bg,
      appBar: AppCenterTitle(
        displayName: '앱 정보',
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed('/VersionInformation');
              },
              child: Container(
                height: 67.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '버전 정보',
                      style: GlobalStyle.setTextStyle(
                          'h4', 'medium', GlobalStyle.orot_black),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 4.w),
                      child: SvgPicture.asset(
                        'images/svg/btn_nm_shortcut_small.svg',
                        width: 16.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/CompanyInformation');
              },
              child: Container(
                height: 67.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '회사 정보',
                      style: GlobalStyle.setTextStyle(
                          'h4', 'medium', GlobalStyle.orot_black),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 4.w),
                      child: SvgPicture.asset(
                        'images/svg/btn_nm_shortcut_small.svg',
                        width: 16.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/TermsAndPoliciesList');
              },
              child: Container(
                height: 67.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '약관 및 정책',
                      style: GlobalStyle.setTextStyle(
                          'h4', 'medium', GlobalStyle.orot_black),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 4.w),
                      child: SvgPicture.asset(
                        'images/svg/btn_nm_shortcut_small.svg',
                        width: 16.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
