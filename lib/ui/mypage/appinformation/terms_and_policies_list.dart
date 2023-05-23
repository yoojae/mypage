import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/terms_and_policies_list_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';

import 'package:orot/global_asset/mypage_app_center.dart';

import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';

//PageId :li01010000p
class TermsAndPoliciesList extends GetView<TermsAndPoliciesListController> {
  TermsAndPoliciesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyle.orot_bg,
      appBar: AppCenterTitle(
        displayName: '약관 및 정책',
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: 67.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('[필수] 오롯 서비스 이용약관 동의',
                      style: GlobalStyle.setTextStyle('h4',
                          'medium', GlobalStyle.orot_black),
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
            );
          },
        ),
      ),
    );
  }
}
