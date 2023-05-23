import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/customer_support_controller.dart';

import 'package:orot/global_asset/app_center_title.dart';

import 'package:orot/global_asset/mypage_app_center.dart';

import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';

//PageId :li01010000p
class CustomerSupport extends GetView<CustomerSupportController> {
  CustomerSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: GlobalStyle.orot_bg,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: GlobalStyle.orot_black,
              size: 18.sp,
            ),
          ),
          title: Text(
            '고객지원',
            style: GlobalStyle.setTextStyle(
                'h3', 'semi_bold', GlobalStyle.orot_black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                labelColor: GlobalStyle.orot_black,
                unselectedLabelColor: GlobalStyle.orot_gray_darker,
                indicatorColor: GlobalStyle.orot_primary,
                tabs: [
                  Tab(
                    child: Text(
                      '자주 묻는 질문',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '카테고리별 Q&A',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 8.h),
                              child: const CostomerSupportListView(
                                  question: '오롯 사용은 어떻게 하나요?')),
                          Container(
                            height: 7.h,
                          ),
                          Container(
                              width: 1.sw,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f7fa))),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 24.h),
                              child: const CostomerSupportButtonBox())
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Column(
                              children: [
                                Container(
                                  height: 32.h,
                                  margin: EdgeInsets.only(top: 24.h),
                                  padding:
                                      EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: GlobalStyle.orot_gray_lightest,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: TextField(
                                    maxLines: 1,
                                    cursorColor: GlobalStyle.orot_gray_dark,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '검색어를 입력해주세요',
                                      hintStyle: GlobalStyle.setTextStyle('h6',
                                          'medium', GlobalStyle.orot_gray_dark),
                                      suffixIcon: SvgPicture.asset(
                                        'images/svg/ic_mp_search.svg',
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                          minHeight: 24.h, minWidth: 24.w),
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: const CostomerSupportListView(
                                        question: '고위험 임산부의 기준이 무엇인가요?')),
                              ],
                            ),
                          ),
                          Container(
                            height: 7.h,
                          ),
                          Container(
                              width: 1.sw,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f7fa))),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 24.h),
                              child: const CostomerSupportButtonBox())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CostomerSupportListView extends StatelessWidget {
  final String question;

  const CostomerSupportListView({Key? key, required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            title: Container(
              padding: EdgeInsets.only(left: 8.w),
              height: 51.h,
              child: Row(
                children: [
                  Text(
                    'Q',
                    style: GlobalStyle.setTextStyle(
                        'h6', 'medium', GlobalStyle.orot_primary),
                  ),
                  Container(
                    width: 10.w,
                  ),
                  Text(
                    question,
                    style: GlobalStyle.setTextStyle(
                        'h6', 'medium', GlobalStyle.orot_gray_darkest),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            color: GlobalStyle.orot_gray_lighter,
          );
        },
        shrinkWrap: true,
        primary: false);
  }
}

class CostomerSupportButtonBox extends StatelessWidget {
  const CostomerSupportButtonBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'images/svg/ic_ma_question_3.svg',
            ),
            Container(
              width: 8.w,
            ),
            Text(
              '직접 문의를 원하시나요?',
              style: GlobalStyle.setTextStyle(
                  'h6', 'medium', GlobalStyle.orot_black),
            )
          ],
        ),
        Container(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/InquiryPage');
          },
          child: Container(
            width: double.infinity,
            height: 48.h,
            decoration: BoxDecoration(
              color: GlobalStyle.orot_primary,
              borderRadius: BorderRadius.circular(24.h),
            ),
            child: Center(
                child: Text(
              '1:1 문의하기',
              style: GlobalStyle.setTextStyle(
                  'h4', 'bold', GlobalStyle.orot_white),
            )),
          ),
        ),
        Container(
          height: 48.h,
        ),
      ],
    );
  }
}
