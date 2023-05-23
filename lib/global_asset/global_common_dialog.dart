import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/global_asset/global_style.dart';

class CommonDaialog extends StatelessWidget {
  const CommonDaialog({
    Key? key,
    this.icons,
    this.contents,
    this.subcontents,
    this.cancelText = '취소',
    this.confirmText = '확인',
    this.confirmColor,
    this.confirmFuntion,
    this.cancelFuntion,
    this.iconColor = Colors.black,
    this.width = 250,
    this.height = 150,
    this.buttonCount = 1,
  }) : super(key: key);

  final IconData? icons;
  final String? contents;
  final String? subcontents;
  final String? cancelText;
  final String? confirmText;
  final Color? confirmColor;
  final VoidCallback? confirmFuntion;
  final VoidCallback? cancelFuntion;
  final Color? iconColor;
  final double? width;
  final double? height;
  final int? buttonCount;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<dynamic> show() {
    return Get.dialog(
        Center(
          child: Container(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: height,
            width: width,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 22.h),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        contents ?? "",
                        style: GlobalStyle.setTextStyle(
                            'h3', 'bold', GlobalStyle.orot_black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 14.h),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subcontents ?? "",
                        style: GlobalStyle.setTextStyle(
                            'h4', 'medium', GlobalStyle.orot_gray_darkest,
                            height: 1.4.h),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                buttonCount == 1
                    ? GestureDetector(
                        onTap: confirmFuntion ??
                            () {
                              Get.back();
                            },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          alignment: Alignment.center,
                          width: 264.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: GlobalStyle.orot_primary,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            confirmText!,
                            style: GlobalStyle.setTextStyle(
                                'h5', 'bold', GlobalStyle.orot_white),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: confirmFuntion,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20.h),
                              alignment: Alignment.center,
                              width: 128.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: GlobalStyle.orot_primary_lighter,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                confirmText!,
                                style: GlobalStyle.setTextStyle(
                                    'h5', 'bold', GlobalStyle.orot_white),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: cancelFuntion ??
                                () {
                                  Get.back();
                                },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20.h),
                              alignment: Alignment.center,
                              width: 128.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: GlobalStyle.orot_primary,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                cancelText!,
                                style: GlobalStyle.setTextStyle(
                                    'h5', 'bold', GlobalStyle.orot_white),
                              ),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
