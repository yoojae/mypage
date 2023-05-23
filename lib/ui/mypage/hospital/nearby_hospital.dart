import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/nearby_hospital_controller.dart';
import 'package:orot/controller/mypage/now_position_controller.dart';
import 'package:orot/controller/mypage/register_myhospital_controller.dart';
import 'package:orot/controller/mypage/search_hospital_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/model/hospital.dart';

//PageId :li01010000p
class NearbyHospital extends GetView<NearbyHospitalController> {
  NearbyHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => Container(
              height: Get.height,
              color: GlobalStyle.orot_bg,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: controller.isLoading.value
                        ? Container()
                        : Text("${controller.currentAddress}"),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 360.w,
                        height: 560.h,
                        decoration: const BoxDecoration(
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
                                const BoxShadow(
                                    color: Color(0xffcfdae6),
                                    offset: Offset(3, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ],
                              color: GlobalStyle.orot_bg),
                          child: controller.isLoading.value
                              ? Container()
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  controller: controller.scrollController,
                                  itemCount:
                                      controller.hospitalList!.data!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        buildNowAddress(
                                            context,
                                            controller
                                                .hospitalList!.data![index]),
                                      ],
                                    );
                                  }),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget buildNowAddress(BuildContext context, Hospital hospital) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 32.w),
          child: Text(
            hospital.name ?? "",
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
                '${(hospital.distance ?? 0).toStringAsFixed(2)} km',
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
                '${hospital.address}',
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
        Container(
          width: 320.w,
          height: 0.4,
          decoration: BoxDecoration(
            color: GlobalStyle.orot_gray_lighter,
          ),
        ),
        Container(
          height: 16.h,
        ),
      ],
    );
  }
}
