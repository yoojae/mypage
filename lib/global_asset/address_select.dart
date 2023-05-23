import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/global_asset/address_select_controller.dart';
import 'package:orot/controller/register/register_info_step01_new_page_controller.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressSelect extends GetView<AddressSelectController> {
  const AddressSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(),
    );
  }

  void showLongHeightModalBottomSheet(BuildContext context, Function callBack) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled를 true로 설정.
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 536.h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: Get.width - 45.w,
                    padding: EdgeInsets.only(left: 45.w),
                    child: Text("지역 선택",
                        style: GlobalStyle.setTextStyle(
                            'h3', 'bold', GlobalStyle.orot_black)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 20.w),
                      alignment: Alignment.centerRight,
                      height: 56,
                      child: SvgPicture.asset(
                        'images/svg/btn_all_leave_medium.svg',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 0.6.h,
                width: Get.width,
                color: GlobalStyle.orot_gray_lightest,
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 128.w,
                      child: listviewCity(context),
                    ),
                    Container(
                      color: GlobalStyle.orot_white,
                      width: 232.w,
                      child: listviewDistrict(context),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (controller.selectedCity.value.isNotEmpty &&
                      controller.selectedDistrict.value.isNotEmpty) {
                    callBack(
                        "${controller.selectedCity.value} ${controller.selectedDistrict.value}");
                    Get.back();
                  }
                },
                child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  height: 48,
                  decoration: const BoxDecoration(color: Color(0xff7a65e8)),
                  child: // 선택
                      Text(
                    "선택",
                    style: GlobalStyle.setTextStyle(
                        'h4', 'bold', GlobalStyle.orot_white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget listviewCity(BuildContext context) {
    return Obx(
      () => ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (String cityName in controller.city)
            GestureDetector(
              onTap: () {
                controller.selectedCity(cityName);
                controller.getCityData(cityName);
                controller.selectedDistrict("");
              },
              child: viewCity(cityName),
            )
        ],
      ),
    );
  }

  Widget viewCity(String cityName) {
    return controller.selectedCity.value == cityName
        ? Stack(
            children: [
              Container(
                width: 128.w,
                color: GlobalStyle.orot_white,
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.center,
                  width: 128.w,
                  height: 56.h,
                  decoration: const BoxDecoration(
                      color: GlobalStyle.orot_gray_lightest),
                  child: Text(
                    '서울시',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'regular', GlobalStyle.orot_black),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  width: 128.w,
                  height: 56.h,
                  decoration: const BoxDecoration(color: Color(0xff7a65e8)),
                  child: Text(
                    cityName,
                    style: GlobalStyle.setTextStyle(
                        'h4', 'semi_bold', GlobalStyle.orot_white),
                  ),
                ),
              ),
            ],
          )
        : Container(
            width: 128.w,
            color: GlobalStyle.orot_white,
            alignment: Alignment.topLeft,
            child: Container(
              alignment: Alignment.center,
              width: 128.w,
              height: 56.h,
              decoration:
                  const BoxDecoration(color: GlobalStyle.orot_gray_lightest),
              child: Text(
                cityName,
                style: GlobalStyle.setTextStyle(
                    'h4', 'regular', GlobalStyle.orot_black),
              ),
            ),
          );
  }

  Widget listviewDistrict(BuildContext context) {
    return Obx(
      () => ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (String districtName in controller.district)
            GestureDetector(
              onTap: () {
                controller.selectedDistrict(districtName);
              },
              child: viewDistrict(districtName),
            )
        ],
      ),
    );
  }

  Widget viewDistrict(String districtName) {
    return controller.selectedDistrict.value == districtName
        ? Container(
            child: // 사각형 3509
                Container(
                    alignment: Alignment.center,
                    width: 232.w,
                    height: 56.h,
                    decoration: const BoxDecoration(color: Color(0xfff5f7fa)),
                    // 포천시
                    child: Text(districtName,
                        style: GlobalStyle.setTextStyle(
                            'h5', 'bold', GlobalStyle.orot_black))),
          )
        : Container(
            alignment: Alignment.center,
            width: 232.w,
            height: 56.h,
            decoration: BoxDecoration(color: GlobalStyle.orot_white),
            child: Text(
              districtName,
              style: GlobalStyle.setTextStyle(
                  'h5', 'regular', GlobalStyle.orot_gray_darkest),
            ),
          );
  }
}
