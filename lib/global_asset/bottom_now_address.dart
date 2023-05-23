import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orot/controller/global_asset/bottom_calender_controller.dart';
import 'package:orot/controller/global_asset/bottom_now_address_controller.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

DateTime? _selectedDate;

class BottomNowAddress extends GetView<BottomNowAddressController> {
  const BottomNowAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      ),
    );
  }

  void showLongHeightModalBottomSheet(BuildContext context, Function callback) {
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
        return Obx(
          () => Container(
            height: Get.height * 0.5,
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width - 45.w,
                  padding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 20.h,
                  ),
                  child: Text("현재주소 ",
                      style: GlobalStyle.setTextStyle(
                          'h3', 'bold', GlobalStyle.orot_black)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
