import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/mypage_main_controller.dart';
import 'package:orot/global_asset/app_less_back.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';

//PageId :li01010000p
class MypageMain extends GetView<MypageMainController> {
  MypageMain({Key? key}) : super(key: key);
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Obx(
              () => controller.isLoading.value
              ? const CircularProgressIndicator()
              : Container(
                color: GlobalStyle.orot_bg,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          buildInfo(context),
                          Container(
                              width: 1.sw,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: GlobalStyle.orot_gray_lightest,
                              )
                          ),
                          buildCustomerCenter(context)
                        ],
                      ),
                    ),
                    buildTopbtn(context),
                  ],
                ),
            ),
        ),
      ),
    );
  }


  Widget buildTopbtn(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 30.w, right: 20.w, bottom: 16.h),
      decoration: BoxDecoration(
        color: controller.userType.value == "general"
            ? GlobalStyle.orot_accent_darkest
            : GlobalStyle.orot_primary_dark,
        boxShadow: [BoxShadow(
            color: controller.userType.value == "general"
                ? Color(0x3eff5a00)
                : Color(0x3e5237e1),
            offset: Offset(0,1),
            blurRadius: 6,
            spreadRadius: 0
        ) ],),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: GlobalStyle.orot_white,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.only(right: 8.w),
                  child: Center(
                      child: SvgPicture.asset(
                          controller.userType.value == "general"
                          ? 'images/svg/normal_profile.svg'
                          : 'images/svg/danger_profile.svg' // png 이미지는 나오는데 svg가 안나옵니다
                      ))
              ), // 수정
              Text("${controller.member?.name ?? ""}님 ",
                  style: GlobalStyle.setTextStyle(
                      'h3',
                      'semi_bold', GlobalStyle.orot_white)
              ), // 수정
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  margin: EdgeInsets.only(right: 19.w),
                  child: SvgPicture.asset(
                    'images/svg/btn_mp_setting.svg',
                  ), // 수정
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'images/svg/btn_all_leave_medium.svg',
                ),
              ), // 수정
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 191.h,
                padding: EdgeInsets.only(left: 33.w, top: 100.h),
                decoration: BoxDecoration(
                  color: controller.userType.value == "general"
                      ? GlobalStyle.orot_accent_darkest
                      : GlobalStyle.orot_primary_dark,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 사각형 3581
                    GestureDetector(
                      onTap: () {
                        controller.toMyinfo();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.w),
                            child: controller.userType.value == "general"
                                ? SvgPicture.asset(
                              'images/svg/ic_mp_normal_myinfo.svg',
                            )
                                : SvgPicture.asset(
                              'images/svg/ic_mp_danger_myinfo.svg',
                            ),
                          ),
                          Text(
                            '내 정보 확인',
                            style: GlobalStyle.setTextStyle(
                                'h5', 'semi_bold', GlobalStyle.orot_white), // 수정
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 33.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.toMyinfo();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.w),
                            child: SvgPicture.asset(
                                    'images/svg/ic_mp_danger_siren.svg',
                              ),
                          ),
                          Text(
                            '인근병원 바로찾기',
                            style: GlobalStyle.setTextStyle(
                                'h5', 'semi_bold', GlobalStyle.orot_white), // 수정
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildSecu(context),
          ],
        ),
        Positioned(
          top: 152.h,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color: GlobalStyle.orot_gray,
                  offset: Offset(0,0),
                  blurRadius: 10,
                  spreadRadius: 0
              ) ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: 320.w,
                height: 88.h,
                color: GlobalStyle.orot_white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 1.sh,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  // POINT
                                  color: GlobalStyle.orot_gray_lighter,
                                  width: 0.4.w,
                                ),
                              ),
                              color: GlobalStyle.orot_white),
                          child: Column(
                            children: [
                              Container(
                                height: 15.h,
                              ),
                              controller.userType.value == "general"
                                  ? SvgPicture.asset(
                                'images/svg/ic_mp_local_high.svg',
                              )
                                  : SvgPicture.asset(
                                'images/svg/ic_mp_normal_local.svg',
                              ),
                              Container(
                                height: 7.h,
                              ),
                              Text(
                                '출산지원정보',
                                style: GlobalStyle.setTextStyle(
                                    'h8', 'semi_bold', GlobalStyle.orot_gray_darkest),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 1.sh,
                          decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  // POINT
                                  color: GlobalStyle.orot_gray_lighter,
                                  width: 0.4.w,
                                ),
                              ),
                              color: GlobalStyle.orot_white),
                          child: Column(
                            children: [
                              Container(
                                height: 16.h,
                              ),
                              controller.userType.value == "general"
                                  ? SvgPicture.asset(
                                'images/svg/ic_mp_bookmark_high.svg',
                              )
                                  : SvgPicture.asset(
                                'images/svg/ic_mp_bookmark.svg',
                              ),
                              Container(
                                height: 6.h,
                              ),
                              Text(
                                '북마크',
                                style: GlobalStyle.setTextStyle(
                                    'h8', 'semi_bold', GlobalStyle.orot_gray_darkest),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 16.h,
                              ),
                              controller.userType.value == "general"
                                  ? SvgPicture.asset(
                                'images/svg/ic_mp_checklist_high.svg',
                              )
                                  : SvgPicture.asset(
                                'images/svg/ic_mp_checklist.svg',
                              ),
                              Container(
                                height: 8.h,
                              ),
                              Text(
                                '체크리스트',
                                style: GlobalStyle.setTextStyle(
                                    'h8', 'semi_bold', GlobalStyle.orot_gray_darkest),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildSecu(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 82.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'images/svg/lock.svg',
                width: 14.w,
              ),
              Container(width: 6.w),
              Text(
                '인증 및 보안',
                style: GlobalStyle.setTextStyle(
                    'h6', 'medium', GlobalStyle.orot_gray_darker),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('앱 화면 잠금',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_black)),
              ),
              FlutterSwitch(
                width: 32.0.w,
                height: 18.0.h,
                toggleSize: 14.0,
                value: controller.isLockChoice.value,
                borderRadius: 30.0,
                showOnOff: false,
                activeColor: GlobalStyle.orot_primary, // activeColor는 general 적용안하나요?
                inactiveColor: GlobalStyle.orot_gray_lighter,
                onToggle: (val) {
                  controller.isLockChoice(val);
                },
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('앱 잠금 비밀번호 변경',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_black)),
              ),
              Container(
                padding: EdgeInsets.only(top: 24.h),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('앱 잠금 생체인증 등록',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_black)),
              ),
              FlutterSwitch(
                width: 32.0.w,
                height: 18.0.h,
                toggleSize: 14.0,
                value: controller.isBioChoice.value,
                borderRadius: 30.0,
                showOnOff: false,
                activeColor: GlobalStyle.orot_primary,
                inactiveColor: GlobalStyle.orot_gray_lighter,
                onToggle: (val) {
                  controller.isBioChoice(val);
                },
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
        ],
      ),
    );
  }

  Widget buildCustomerCenter(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 26.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'images/svg/customer-service.svg',
                width: 14.w,
              ),
              Container(width: 7.w),
              Text(
                '고객센터',
                style: GlobalStyle.setTextStyle(
                    'h6', 'medium', GlobalStyle.orot_gray_darker),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/NoticeList');
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('공지사항',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'medium', GlobalStyle.orot_black)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/Instructions');
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('사용설명 페이지',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'medium', GlobalStyle.orot_black)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/CustomerSupport');
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text('고객지원',
                  style: GlobalStyle.setTextStyle(
                      'h4', 'medium', GlobalStyle.orot_black)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('앱정보',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_black)),
          ),
          Container(
            padding: EdgeInsets.only(top: 24.h),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('서비스 해지',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_black)),
          ),
          Container(
            padding: EdgeInsets.only(top: 48.h),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
