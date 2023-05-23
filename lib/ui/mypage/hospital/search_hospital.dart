import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/search_hospital_controller.dart';
import 'package:orot/global_asset/global_common_dialog.dart';
import 'package:orot/global_asset/global_style.dart';

import '../../../global_asset/common.dart';

//PageId :li01010000  김효정
class SearchHospital extends GetView<SearchHospitalController> {
  SearchHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 0.h, left: 20.w, right: 20.w),
            height: Get.height,
            color: GlobalStyle.orot_bg,
            child: Column(
              children: [
                builddSearchHospitalName(context),
                Container(
                    margin: EdgeInsets.only(top: 16.h),
                    width: 1.sw,
                    height: 1.h,
                    decoration: BoxDecoration(color: const Color(0xfff5f7fa))),
                buildNowPosition(context),
                Container(
                  height: 24.h,
                ),
                buildRecentSearchTerm(context),
                Container(
                  height: 48.h,
                ),
                buildRecommendedSearchTerm(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget builddSearchHospitalName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'images/svg/ic_mp_search.svg',
            ),
            Container(
              width: Get.width - 95.w,
              padding: EdgeInsets.only(left: 16.w),

              // alignment: Alignment.center,

              child: TextField(
                maxLines: 1,
                cursorColor: GlobalStyle.orot_gray_dark,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '병원명을 입력하여 검색',
                  hintStyle: GlobalStyle.setTextStyle(
                      'h3', 'regular', GlobalStyle.orot_gray_darker),
                ),
              ),
            ),
          ],
        ),
        Container(
          child: SvgPicture.asset(
            'images/svg/btn_all_leave_medium.svg',
          ),
        ),
      ],
    );
  }

  Widget buildNowPosition(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await Common.isLocationPermission()) {
          Get.toNamed("NowPosition");
        }
      },
      child: Container(
        width: 320.w,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            color: GlobalStyle.orot_gray_lightest),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 24.w,
                ),
                SvgPicture.asset(
                  'images/svg/ic_mp_mylocation.svg',
                ),
                Container(
                  width: 12.w,
                ),
                Text('현재 위치로 주소 검색',
                    style: GlobalStyle.setTextStyle(
                        'h4', '', GlobalStyle.orot_gray_dark)),
                Container(
                  width: 8.w,
                ),
                SvgPicture.asset(
                  'images/svg/btn_mp_rightarrow.svg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecentSearchTerm(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '최근 검색어',
            style: GlobalStyle.setTextStyle(
                'h6', 'semi_bold', GlobalStyle.orot_black),
          ),
        ),
        Container(
          height: 24.h,
        ),
        Container(
          child: Text(
            '최근 검색어가 없습니다',
            style: GlobalStyle.setTextStyle(
                'h6', '', GlobalStyle.orot_gray_darkest),
          ),
        ),
      ],
    );
  }

  Widget buildRecommendedSearchTerm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '추천 검색어',
            style: GlobalStyle.setTextStyle(
                'h6', 'semi_bold', GlobalStyle.orot_black),
          ),
        ),
        Container(
          height: 24.h,
        ),
        // 사각형 3706
        Container(
          width: 66.w,
          height: 33.w,
          padding: EdgeInsets.fromLTRB(
            16.w,
            8.h,
            16.w,
            8.h,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: GlobalStyle.orot_gray_lightest),
          child: Text(
            '전문의',
            style: GlobalStyle.setTextStyle(
                'h7', 'medium', GlobalStyle.orot_black),
          ),
        )
      ],
    );
  }
}
