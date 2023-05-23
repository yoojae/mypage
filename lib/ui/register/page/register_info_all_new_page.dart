// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_all_new_page_controller.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orot/model/member.dart';
import 'package:orot/repository/member_repository.dart';

//PageId :ma04010000p

class ResisterInfoAllNewPage extends GetView<ResisterInfoAllNewPageController> {
  const ResisterInfoAllNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: AppbarlessAllPadding(context),
              color: GlobalStyle.orot_bg,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: 56,
                        child: SvgPicture.asset(
                          'images/svg/btn_all_leave_medium.svg',
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 24.h),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: '오롯 이용을 위해',
                              style: GlobalStyle.setTextStyle(
                                'h2',
                                'regular',
                                GlobalStyle.orot_black,
                              ),
                            ),
                          ]))),
                      Container(
                          padding: EdgeInsets.only(top: 6.h),
                          alignment: Alignment.topLeft,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '정보확인',
                                style: GlobalStyle.setTextStyle(
                                    'h2', 'bold', GlobalStyle.orot_black)),
                            TextSpan(
                                text: '을 진행할게요',
                                style: GlobalStyle.setTextStyle(
                                    'h2', 'regular', GlobalStyle.orot_black)),
                          ]))),
                      InfoConfirm(context)
                    ],
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 48.h,
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       color: GlobalStyle.orot_gray_light,
                  //       borderRadius: BorderRadius.circular(24.0.h),
                  //     ),
                  //     child: Text("확인",
                  //         style: GlobalStyle.setTextStyle(
                  //             'h4', 'bold', GlobalStyle.orot_white)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget InfoConfirm(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 36.h),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text:
                    '${controller.member?.age ?? ""}세 ${controller.member?.name ?? ""}',
                style: GlobalStyle.setTextStyle(
                  'h2',
                  'bold',
                  GlobalStyle.orot_black,
                )),
            TextSpan(
                text: ' 님은\n',
                style: GlobalStyle.setTextStyle(
                  'h2',
                  'regular',
                  GlobalStyle.orot_black,
                )),
            TextSpan(
                text: " ${controller.member?.address ?? ""} ",
                style: GlobalStyle.setTextStyle(
                    'h2', 'bold', GlobalStyle.orot_primary,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_primary,
                    height: 2)),
            controller.member!.address!.length < 8
                ? TextSpan(
                    text: '에 거주중이며\n',
                    style: GlobalStyle.setTextStyle(
                      'h2',
                      'regular',
                      GlobalStyle.orot_black,
                    ))
                : TextSpan(children: [
                    TextSpan(
                        text: '에\n',
                        style: GlobalStyle.setTextStyle(
                          'h2',
                          'regular',
                          GlobalStyle.orot_black,
                        )),
                    TextSpan(
                        text: '거주중이며',
                        style: GlobalStyle.setTextStyle(
                          'h2',
                          'regular',
                          GlobalStyle.orot_black,
                        ))
                  ]),
            TextSpan(
                text:
                    ' ${controller.member?.isWork ?? false ? "  근로자  " : "  비근로자  "} ',
                style: GlobalStyle.setTextStyle(
                    'h2', 'bold', GlobalStyle.orot_primary,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_primary,
                    height: 2)),
            TextSpan(
                text: '예요.\n',
                style: GlobalStyle.setTextStyle(
                  'h2',
                  'regular',
                  GlobalStyle.orot_black,
                )),
            TextSpan(
                text: '현재 ',
                style: GlobalStyle.setTextStyle(
                  'h2',
                  'regular',
                  GlobalStyle.orot_black,
                )),
            TextSpan(
                text: (controller.member?.deliver ?? 'primipara') == 'primipara'
                    ? "  초산  "
                    : "  경산  ",
                style: GlobalStyle.setTextStyle(
                    'h2', 'bold', GlobalStyle.orot_primary,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_primary,
                    height: 2)),
            TextSpan(
                text: '으로 ',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
            TextSpan(
                text: (controller.member?.unborns?.length ?? 1) == 1
                    ? "  단태아  "
                    : "  다태아  ",
                style: GlobalStyle.setTextStyle(
                    'h2', 'bold', GlobalStyle.orot_primary,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_primary,
                    height: 2)),
            if ((controller.member?.unborns?.length ?? 1) > 1)
              TextSpan(
                children: [
                  WidgetSpan(child: SizedBox(width: 1)),
                  TextSpan(
                      text: '\r',
                      style: GlobalStyle.setTextStyle(
                          'h2', 'regular', GlobalStyle.orot_black,
                          height: 2)),
                ],
              ),
            TextSpan(
                text: '\n( ',
                style: GlobalStyle.setTextStyle(
                  'h2',
                  'regular',
                  GlobalStyle.orot_black,
                )),
            for (var unborn in controller.member!.unborns!)
              TextSpan(children: [
                TextSpan(
                    text: '  ${unborn.unbornBabyName}  ',
                    style: GlobalStyle.setTextStyle(
                        'h2', 'bold', GlobalStyle.orot_primary,
                        decoration: TextDecoration.underline,
                        decorationColor: GlobalStyle.orot_primary,
                        height: 2)),
                (unborn.isEnter ?? false)
                    ? TextSpan(children: [
                        WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(
                            text: ' \r\n',
                            style: GlobalStyle.setTextStyle(
                              'h2',
                              'regular',
                              GlobalStyle.orot_black,
                            ))
                      ])
                    : TextSpan(
                        text: ' ',
                        style: GlobalStyle.setTextStyle(
                          'h2',
                          'regular',
                          GlobalStyle.orot_black,
                        )),
              ]),
            TextSpan(
                text: ')',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
            TextSpan(
                text: '를 임신중이에요.\n',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
            TextSpan(
                text: '출산예정일은',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
            TextSpan(
                text: ' ${controller.dueDate.value}  ',
                //년도에 23년만
                style: GlobalStyle.setTextStyle(
                    'h2', 'bold', GlobalStyle.orot_primary,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_primary,
                    height: 2)),
            TextSpan(
                text: '이고\n',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
            const WidgetSpan(child: SizedBox(width: 1)),
            TextSpan(
                text: '',
                style: GlobalStyle.setTextStyle(
                  'h2',
                  'regular',
                  GlobalStyle.orot_black,
                )),
            TextSpan(
                text: '임신 전 진단 받은 질환은\n',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
            (controller.displayDiseasePreCount.value > 0)
                ? TextSpan(children: [
                    TextSpan(
                        //진단이 있으면 이라인
                        text: controller.displayDiseasePreName.value,
                        style: GlobalStyle.setTextStyle(
                            'h2', 'bold', GlobalStyle.orot_primary,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_primary,
                            height: 2)),
                    TextSpan(
                        text: '가 있으며\n',
                        style: GlobalStyle.setTextStyle(
                            'h2', 'regular', GlobalStyle.orot_black,
                            height: 2)),
                  ])
                : TextSpan(children: [
                    TextSpan(
                        //진단이 없으면 이라인
                        text: (controller.member?.preDisease ?? "") == "no"
                            ? "  없음  "
                            : "  모름  ",
                        style: GlobalStyle.setTextStyle(
                            'h2', 'bold', GlobalStyle.orot_primary,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_primary,
                            height: 2)),
                    TextSpan(
                        text: '이에요.\n',
                        style: GlobalStyle.setTextStyle(
                            'h2', 'regular', GlobalStyle.orot_black,
                            height: 2)),
                  ]),
            TextSpan(
                text: '임신 후 진단 받은 질환은\n',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
            (controller.displayDiseaseAfterCount.value > 0)
                ? TextSpan(children: [
                    TextSpan(
                        //진단이 있으면 이라인
                        text: controller.displayDiseaseAfterName.value,
                        style: GlobalStyle.setTextStyle(
                            'h2', 'bold', GlobalStyle.orot_primary,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_primary,
                            height: 2)),
                    TextSpan(
                        text: '가 있어요.\n',
                        style: GlobalStyle.setTextStyle(
                            'h2', 'regular', GlobalStyle.orot_black,
                            height: 2)),
                  ])
                : TextSpan(children: [
                    TextSpan(
                        //진단이 없으면 이라인
                        text: (controller.member?.afterDisease ?? "") == "no"
                            ? "  없음  "
                            : "  모름  ",
                        style: GlobalStyle.setTextStyle(
                            'h2', 'bold', GlobalStyle.orot_primary,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_primary,
                            height: 2)),
                    TextSpan(
                        text: '이에요.\n',
                        style: GlobalStyle.setTextStyle(
                            'h2', 'regular', GlobalStyle.orot_black,
                            height: 2)),
                  ]),
            TextSpan(
                text: '입력된 정보가 맞으신가요?',
                style: GlobalStyle.setTextStyle(
                    'h2', 'regular', GlobalStyle.orot_black,
                    height: 2)),
          ]))),
      controller.isRegistered.value
          ? Container(
              padding: EdgeInsets.only(top: 48.h, bottom: 0.h),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toNext();
                    },
                    child: Container(
                      height: 48.h,
                      margin: EdgeInsets.only(top: 8.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24.h)),
                          color: GlobalStyle.orot_primary_lighter),
                      child: Text(
                        '네 맞아요',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'medium', GlobalStyle.orot_white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toEdit();
                    },
                    child: Container(
                      height: 48.h,
                      margin: EdgeInsets.only(top: 8.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24.h)),
                          color: GlobalStyle.orot_primary_lighter),
                      child: Text(
                        '일부 수정이 필요해요',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'medium', GlobalStyle.orot_white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toAllEdit();
                    },
                    child: Container(
                      height: 48.h,
                      margin: EdgeInsets.only(top: 8.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24.h)),
                          color: GlobalStyle.orot_primary_lighter),
                      child: Text(
                        '전체수정이 필요해요',
                        style: GlobalStyle.setTextStyle(
                            'h4', 'medium', GlobalStyle.orot_white),
                      ),
                    ),
                  ),
                ],
              ))
          : Container(
              padding: EdgeInsets.only(top: 74.h, bottom: 0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toEdit();
                    },
                    child: Container(
                      width: 156.w,
                      height: 48.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: GlobalStyle.orot_primary_lighter,
                        borderRadius: BorderRadius.circular(24.0.h),
                      ),
                      child: Text("아니에요",
                          style: GlobalStyle.setTextStyle(
                              'h4', 'bold', GlobalStyle.orot_white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toNext();
                    },
                    child: Container(
                      height: 48.h,
                      width: 156.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: GlobalStyle.orot_primary,
                        borderRadius: BorderRadius.circular(24.0.h),
                      ),
                      child: Text("네, 맞아요",
                          style: GlobalStyle.setTextStyle(
                              'h4', 'bold', GlobalStyle.orot_white)),
                    ),
                  ),
                ],
              ),
            ),
      //기존회원이면 아래버튼
    ]);
  }
}
