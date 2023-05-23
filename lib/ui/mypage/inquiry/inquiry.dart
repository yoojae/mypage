import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/inquiry_controller.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:orot/ui/mypage/inquiry/inquiry_history.dart';
import 'package:orot/ui/mypage/inquiry/inquiry_now.dart';

class InquiryPage extends GetView<InquiryController> {
  const InquiryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            child: SvgPicture.asset(
              'images/svg/btn_all_before_medium.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          centerTitle: true,
          title: Text('1:1 문의하기',
              style: GlobalStyle.setTextStyle(
                  'h3', "semi_bold", GlobalStyle.orot_black)),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                labelColor: GlobalStyle.orot_black,
                unselectedLabelColor: GlobalStyle.orot_gray_light,
                indicatorColor: GlobalStyle.orot_primary,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Tab(
                    text: '문의하기',
                  ),
                  Tab(text: '문의 내역 확인'),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InquiryNowPage(),
                      InquiryHistoryPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
