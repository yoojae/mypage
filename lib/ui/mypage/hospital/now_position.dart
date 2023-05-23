import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/now_position_controller.dart';
import 'package:orot/global_asset/global_style.dart';

//PageId :li01010000p
class NowPosition extends GetView<NowPositionController> {
  NowPosition({Key? key}) : super(key: key);

  late EdgeInsets safeArea;
  double drawerHeight = 0;

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
                  builddSearchHospitalName(context),
                  Stack(
                    children: [
                      Container(
                        width: 360.w,
                        height: 560.h,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(200, 200, 200, 1)),
                        child: controller.isInitLoading.value
                            ? Container()
                            : NaverMap(
                                options: NaverMapViewOptions(
                                  mapType: NMapType.basic,
                                  initialCameraPosition: NCameraPosition(
                                      target: NLatLng(controller.latitude,
                                          controller.longitude),
                                      zoom: 15,
                                      bearing: 0,
                                      tilt: 0),
                                ),
                                onMapReady: controller.onMapReady,
                                onMapTapped: (point, latLng) {
                                  controller.getAddress(
                                      latLng.latitude, latLng.longitude);
                                },
                              ),
                      ),
                      Positioned(
                          top: 370.h,
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
      ),
    );
  }

  Widget builddSearchHospitalName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 20.w,
            ),
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
                  hintText: '주소를 입력하여 검색',
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
        Container(
          width: 20.w,
        ),
      ],
    );
  }

  Widget buildNowAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 32.w),
          child: Text(
            '핀을 움직여 현재 위치를 설정해 주세요.',
            style: GlobalStyle.setTextStyle(
                'h6', 'medium', GlobalStyle.orot_primary),
          ),
        ),
        Container(
          height: 16.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 32.w),
          child: controller.isLoading.value
              ? Container()
              : Text(
                  controller.roadAddrName,
                  style: GlobalStyle.setTextStyle(
                      'h4', 'semi_bold', GlobalStyle.orot_black),
                ),
        ),
        Container(
          height: 10.h,
        ),
        Row(
          children: [
            // 사각형 3706
            Container(
              margin: EdgeInsets.only(left: 32.w),
              width: 40.w,
              height: 20.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: GlobalStyle.orot_gray_lighter,
                      width: 0.800000011920929),
                  color: GlobalStyle.orot_bg),
              child: Text(
                '지번',
                style: GlobalStyle.setTextStyle(
                    'h8', 'medium', GlobalStyle.orot_gray_darkest),
              ),
            ),
            Container(
              width: 16.w,
            ),
            // 경기 고양시 일산동구 식사동 814
            controller.isLoading.value
                ? Container()
                : Text(
                    controller.addrName,
                    style: GlobalStyle.setTextStyle(
                        'h6', 'medium', GlobalStyle.orot_gray_darkest),
                  ),
          ],
        ),
        Container(
          height: 22.h,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('NearbyHospital', arguments: {
              "NLatLng": NLatLng(controller.latitude, controller.longitude)
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: GlobalStyle.orot_primary,
              borderRadius: BorderRadius.circular(24.0.h),
            ),
            child: Text("지정한 위치에서 확인",
                style: GlobalStyle.setTextStyle(
                    'h4', 'bold', GlobalStyle.orot_white)),
          ),
        ),
        Container(
          height: 48.h,
        ),
      ],
    );
  }
}
