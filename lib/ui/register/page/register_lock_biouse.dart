import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_lock_biouse_controller.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/model/member.dart';

//PageId :li01010000p
class RegisterLockBioUse extends GetView<RegisterLockBioUseController> {
  RegisterLockBioUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container());
  }

  void showLongHeightModalBottomSheet(BuildContext context, Member? member) {
    controller.member = member;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: Get.height * 0.60,
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 48.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.h)),
            color: GlobalStyle.orot_bg,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                height: 40.h,
                child: SvgPicture.asset(
                  'images/svg/btn_all_leave_medium.svg',
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  top: 5.h,
                ),
                child: Text("잠금 해제 방식을 선택해 주세요.",
                    style: GlobalStyle.setTextStyle(
                        'h3', 'bold', GlobalStyle.orot_black)),
              ),
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'images/svg/img_li_unlock.svg',
                  height: 60.h,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 32.h, bottom: 32.h),
                alignment: Alignment.center,
                //클릭했을때 Primary 색상으로요
                child: Text(
                  '‘인증 및 보안’에서 언제든 변경이 가능합니다.',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'regular', GlobalStyle.orot_gray_darkest),
                ),
              ),
              GestureDetector(
                onTap: ()  async{

                  await Common.saveAuthPassword(true);
                  controller.toNext();
                },
                child: Container(
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24.h)),
                      color: GlobalStyle.orot_primary), //클릭했을때 Primary 색상으로요
                  child: Text(
                    '비밀번호',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async{
                  await Common.saveAuthPassword(false);
                  controller.canLocalAuth().then((value) {
                    if (value) {
                      Common.setLocalAuth().then((value) {
                        if (value) {
                          Common.showToast("등록되었습니다.");
                          controller.toNext();
                        } else {
                          Common.showToast("등록이 실패되었습니다. 휴대폰 설정을 확인해 주세요.");
                          AppSettings.openSecuritySettings();
                        }
                      });
                    } else {
                      Common.showToast("생체인증이 지원되지 않은 휴대폰입니다.");
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8.h),
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24.h)),
                      color: GlobalStyle.orot_primary),
                  child: Text(
                    '생체인증',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
