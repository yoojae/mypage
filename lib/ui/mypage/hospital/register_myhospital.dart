import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/register_myhospital_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/global_style.dart';

//PageId :li01010000p
class RegisterMyHospital extends GetView<RegisterMyHospitalController> {
  RegisterMyHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCenterTitle(
        displayName: '내 병원 등록',
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w),
            height: Get.height,
            color: GlobalStyle.orot_bg,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SvgPicture.asset(
                    'images/svg/icon_hospital.svg',
                  ),
                  Container(width: 8.w),
                  Text(
                    '병원정보',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_gray_darkest),
                  ),
                ]),
                Container(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('SearchHospital');
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
                              'images/svg/ic_mp_plus.svg',
                            ),
                            Container(
                              width: 12.w,
                            ),
                            Text('내 병원 정보 검색',
                                style: GlobalStyle.setTextStyle(
                                    'h5', 'medium', GlobalStyle.orot_black)),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'images/svg/btn_nm_shortcut_small.svg',
                            ),
                            Container(
                              width: 24.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 8.h,
                ),
                Container(
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
                            'images/svg/ic_mp_plus.svg',
                          ),
                          Container(
                            width: 12.w,
                          ),
                          Text('내 병원 정보 직접 입력',
                              style: GlobalStyle.setTextStyle(
                                  'h5', 'medium', GlobalStyle.orot_black)),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'images/svg/btn_nm_shortcut_small.svg',
                          ),
                          Container(
                            width: 24.w,
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
