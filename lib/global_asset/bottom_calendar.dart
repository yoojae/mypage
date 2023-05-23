import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orot/controller/global_asset/bottom_calender_controller.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

DateTime? _selectedDate;

class BottomCalender extends GetView<BottomCalenderController> {
  const BottomCalender({Key? key}) : super(key: key);

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
                  child: Text(controller.selectedString.value,
                      style: GlobalStyle.setTextStyle(
                          'h3', 'bold', GlobalStyle.orot_black)),
                ),
                Container(
                  height: 0.6.h,
                  width: Get.width,
                  color: GlobalStyle.orot_gray_lightest,
                ),
                DatePickerWidget(
                  looping: false, // default is not looping
                  firstDate: DateTime.now(), //DateTime(1960),
                  dateFormat: "yyyy/MM/dd",
                  locale: DatePicker.localeFromString('ko'),
                  onChange: (DateTime newDate, _) {
                    //print(newDate);
                    _selectedDate = newDate;
                    controller.selectedString(
                        DateFormat('yyyy년 MM월 dd일').format(newDate));
                  },
                  pickerTheme: DateTimePickerTheme(
                    backgroundColor: Colors.transparent,
                    pickerHeight: 185.h,
                    itemHeight: 50.h,
                    itemTextStyle: GlobalStyle.setTextStyle(
                        'h4', 'bold', GlobalStyle.orot_black),
                    dividerColor: Colors.transparent,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 48.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 156.w,
                          height: 48.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: GlobalStyle.orot_primary_lighter,
                            borderRadius: BorderRadius.circular(24.0.h),
                          ),
                          child: Text("취소",
                              style: GlobalStyle.setTextStyle(
                                  'h4', 'bold', GlobalStyle.orot_white)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_selectedDate != null) {
                            String selectedDate = DateFormat('yyyy / MM / dd')
                                .format(_selectedDate!);
                            callback(selectedDate);
                            Get.back();
                          }
                        },
                        child: Container(
                          height: 48.h,
                          width: 156.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: GlobalStyle.orot_primary,
                            borderRadius: BorderRadius.circular(24.0.h),
                          ),
                          child: Text("선택",
                              style: GlobalStyle.setTextStyle(
                                  'h4', 'bold', GlobalStyle.orot_white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
