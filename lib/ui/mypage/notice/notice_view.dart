import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/notice_view_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';

import 'package:orot/global_asset/mypage_app_center.dart';

import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:orot/ui/mypage/notice/notice_list.dart';

//PageId :li01010000p
class NoticeView extends GetView<NoticeViewController> {
  NoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyle.orot_bg,
      appBar: AppCenterTitle(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              Container(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '병원 진료 기록 기능이 생겼어요',
                      style: GlobalStyle.setTextStyle(
                          'h3', 'semi_bold', GlobalStyle.orot_black),
                    ),
                    Container(
                      height: 8.h,
                    ),
                    Text(
                      '2023.05.29',
                      style: GlobalStyle.setTextStyle(
                          'h8', 'regular', GlobalStyle.orot_gray_darker),
                    ),
                  ],
                ),
              ),
              Container(
                height: 16.h,
              ),
              Divider(
                height: 0,
                indent: 0,
                thickness: 1,
                color: GlobalStyle.orot_gray_lighter,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  '안녕하세요. 오롯입니다. 이것이야말로 무엇이 예수는 살았으며, 크고 봄바람을 약동하다. 따뜻한 반짝이는 피가 것은 미인을 넣는 때문이다. 풍부하게 인생에 시들어 있을 가치를 힘있다. 맺어, 그들은 같이 살 품고 칼이다. 새 얼마나 인생에 사랑의 것이다. 보라, 인간의 돋고, 그리하였는가? 방지하는 그들의 그들은 같은 소담스러운 무한한 내는 풍부하게 방황하여도, 위하여서. 같이, 너의 품에 간에 싸인 보배를 관현악이며, 굳세게 서있는가? 얼음이 예수는 앞이 것이다. 바로 길을 눈에 그들의 크고 지혜는 부패뿐이다. 피고, 이상, 인간은 이것이다. 든 목숨을 청춘 약동하다.',
                  style: GlobalStyle.setTextStyle(
                      'h6', 'regular', GlobalStyle.orot_gray_darkest,
                      height: 2.5),
                ),
              ),
              Container(
                height: 48.h,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
