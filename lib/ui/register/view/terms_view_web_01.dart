// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/controller/register/terms_view_web_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:orot/global_asset/global_style.dart';

class TermsViewWeb01 extends GetView<TermsView_webController> {
  const TermsViewWeb01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cookieManager = CookieManager();
    WebViewController _controller;

    return Scaffold(
        appBar: AppCenterTitle(
          displayName: '',
        ),
        body: SafeArea(
            child: Container(
          padding: ButtonAllPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("[필수] 오롯 서비스 이용약관 동의",
                    style: GlobalStyle.setTextStyle(
                        'h3', 'bold', GlobalStyle.orot_black)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                  height: 0.5,
                  decoration: BoxDecoration(color: const Color(0xffe8e8e8))),
              Container(
                  // 약관 들어오면 됩니다
                  )
            ],
          ),
        )));
  }
}
