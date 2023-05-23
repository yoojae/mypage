import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_lock_use_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/ui/register/page/register_lock_biouse.dart';

//PageId :li01010000p
class RegisterLockUse extends GetView<RegisterLockUseController> {
  RegisterLockUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCenterTitle(),
      body: Obx(
        () => SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                color: GlobalStyle.orot_bg,
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 40.h, bottom: 6.h),
                      child: Text("앱 보안을 위해",
                          style: GlobalStyle.setTextStyle(
                              'h2', 'regular', GlobalStyle.orot_black)),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 6),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: '잠금기능',
                              style: GlobalStyle.setTextStyle(
                                  'h2', 'bold', GlobalStyle.orot_black)),
                          TextSpan(
                              text: '을 사용하시겠어요?',
                              style: GlobalStyle.setTextStyle(
                                  'h2', 'regular', GlobalStyle.orot_black)),
                        ]))),
                    buildRockuse(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRockuse(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48.h, left: 20.w, right: 20.w),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            // 여기서 생체나 비번 사용페이지가 버텀으로...
            onTap: () {
              controller.setUse(!controller.isUse.value);
              controller.saveLocalData();
              RegisterLockBioUse()
                  .showLongHeightModalBottomSheet(context, controller.member);
            },
            child: Container(
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.isUse.value
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter), //클릭했을때 Primary 색상으로요
              child: Text(
                '사용할래요',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
          InkWell(
            // 이거 누르면 바로 저장!!! / 저장후 보이는 페이지는 만들께요
            onTap: () {
              controller.setUse(false);
              controller.isNext(!controller.isNext.value);
              //회원가입
              if (controller.isNext.value) {
                controller.toNext();
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.h)),
                  color: controller.isNext.value
                      ? GlobalStyle.orot_primary
                      : GlobalStyle.orot_primary_lighter),
              child: Text(
                '다음에',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
