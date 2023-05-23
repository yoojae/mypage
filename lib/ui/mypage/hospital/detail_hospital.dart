import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/detail_hospital)controller.dart';
import 'package:orot/controller/mypage/nearby_hospital_controller.dart';
import 'package:orot/controller/mypage/now_position_controller.dart';
import 'package:orot/controller/mypage/register_myhospital_controller.dart';
import 'package:orot/controller/mypage/search_hospital_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/global_style.dart';

//PageId :li01010000p
class DetailHospital extends GetView<DetailHospitalController> {
  DetailHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
            height: Get.height,
            color: GlobalStyle.orot_bg,
            child: Column(
              children: [
                Container(
                  child: Text('병명'),
                ),
                Stack(
                  children: [
                    Container(
                      width: 360.w,
                      height: 560.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(200, 200, 200, 1)),
                    ),
                    Container(
                      height: 32.h,
                    ),
                    Positioned(
                        top: 350.h,
                        child: Container(
                            width: 360.w,
                            height: 230.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24.w)),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xffcfdae6),
                                      offset: Offset(3, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ],
                                color: GlobalStyle.orot_bg),
                            child: buildNowAddress(context))),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget buildNowAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 32.w),
          child: Text(
            '동국대학교 일산병원',
            style: GlobalStyle.setTextStyle(
                'h4', 'bold', GlobalStyle.orot_primary),
          ),
        ),
        Container(
          height: 8.h,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 32.w),
              child: Text(
                '10m',
                style: GlobalStyle.setTextStyle(
                    'h6', 'semi_bold', GlobalStyle.orot_black),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                '|',
                style:
                    GlobalStyle.setTextStyle('h6', '', GlobalStyle.orot_black),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                '종합벼원',
                style:
                    GlobalStyle.setTextStyle('h6', ' ', GlobalStyle.orot_black),
              ),
            ),
          ],
        ),
        Container(
          height: 16.h,
        ),
        // 선 863
        Column(),
        Text('병원주소'),
        Text('전화번호'),
        Container(
          height: 16.h,
        ),
      ],
    );
  }
}
