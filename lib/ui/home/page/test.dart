import 'package:orot/controller/home/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:orot/global_asset/common.dart';

class Test extends GetView<HomePageController> {
  Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Common.getMobileId();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/ResisterTermsPage');
                      },
                      child: Text('약관체크- 여기부터 들어가야 정보가 다 나옵니다')),
                ),
                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/ResisterInfoStep00Page');
                //       },
                //       child: Text('본인인증')),
                // ),

                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/ResisterNewLoginNumber');
                      },
                      child: Text('비번설정')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/RegisterLockUse');
                      },
                      child: Text('잠금설정 사용여부')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/RegisterLockBioUse');
                      },
                      child: Text('생체여부')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/LockNumber');
                      },
                      child: Text('비번으로 락풀기')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/WelcometoNew');
                      },
                      child: Text('환영합니다')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/AlarmList');
                      },
                      child: Text('알림리스트')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/AlarmView');
                      },
                      child: Text('알림뷰')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/AlarmSet');
                      },
                      child: Text('알림설정')),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  color: Colors.cyan,
                  child: GestureDetector(onTap: () {}, child: Text('고위험 산모')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
