import 'package:flutter/services.dart';
import 'package:orot/controller/home/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Common.getMobileId();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(),
              child: Column(children: [
                controller.userType.value == "general"
                    ? GestureDetector(
                        onTap: () {
                          controller.toNext();
                        },
                        child: Container(
                          width: Get.width,
                          child: Image.asset('images/png/main_hi.png',
                              fit: BoxFit.fitWidth),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.toNext();
                        },
                        child: Container(
                          width: Get.width,
                          child: Image.asset('images/png/main_ge.png',
                              fit: BoxFit.fitWidth),
                        ),
                      ),

                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/RegisterLockUse');
                //       },
                //       child: Text('잠금설정 사용여부')),
                // ),
                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/RegisterLockBioUse');
                //       },
                //       child: Text('생체여부')),
                // ),
                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/LockNumber');
                //       },
                //       child: Text('비번으로 락풀기')),
                // ),

                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/AlarmList');
                //       },
                //       child: Text('알림리스트')),
                // ),
                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/AlarmView');
                //       },
                //       child: Text('알림뷰// 루티하고 My에만 해당 지금은 작업 못할듯')),
                // ),

                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/AlarmSet');
                //       },
                //       child: Text('알림설정')),
                // ),
                // Container(
                //   height: 50.h,
                //   width: 100.w,
                //   color: Colors.cyan,
                //   child: GestureDetector(
                //       onTap: () {
                //         Get.toNamed('/RegisterMyHospital');
                //       },
                //       child: Text('내 병원등록')),
                // ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
