// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orot/controller/register/register_info_all_edit_page_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';
import 'package:orot/global_asset/app_less_back.dart';
import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

//PageId :ma04010000p

class ResisterInfoAllEditPage
    extends GetView<ResisterInfoAllEditPageController> {
  const ResisterInfoAllEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      appBar: AppCenterTitle(),
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
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    controller.to01();
                  },
                style: GlobalStyle.setTextStyle(
                    'h2',
                    'bold',
                    (controller.member?.address !=
                            controller.orgMember?.address)
                        ? GlobalStyle.orot_primary
                        : GlobalStyle.orot_gray_lighter,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_gray_lighter,
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
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    controller.to01();
                  },
                style: GlobalStyle.setTextStyle(
                    'h2',
                    'bold',
                    (controller.member?.isWork != controller.orgMember?.isWork)
                        ? GlobalStyle.orot_primary
                        : GlobalStyle.orot_gray_lighter,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_gray_lighter,
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
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    controller.to02();
                  },
                style: GlobalStyle.setTextStyle(
                    'h2',
                    'bold',
                    (controller.member?.deliver !=
                            controller.orgMember?.deliver)
                        ? GlobalStyle.orot_primary
                        : GlobalStyle.orot_gray_lighter,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_gray_lighter,
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
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    controller.to03();
                  },
                style: GlobalStyle.setTextStyle(
                    'h2',
                    'bold',
                    (controller.member?.unborns?.length !=
                            controller.orgMember?.unborns?.length)
                        ? GlobalStyle.orot_primary
                        : GlobalStyle.orot_gray_lighter,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_gray_lighter,
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
            for (int i = 0; i < controller.member!.unborns!.length; i++)
              TextSpan(children: [
                TextSpan(
                    text: '  ${controller.member!.unborns![i].unbornBabyName}'
                        '  ',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        controller.to04();
                      },
                    style: GlobalStyle.setTextStyle(
                        'h2',
                        'bold',
                        (controller.member!.unborns![i].unbornBabyName !=
                                controller
                                    .orgMember?.unborns![i].unbornBabyName)
                            ? GlobalStyle.orot_primary
                            : GlobalStyle.orot_gray_lighter,
                        decoration: TextDecoration.underline,
                        decorationColor: GlobalStyle.orot_gray_lighter,
                        height: 2)),
                (controller.member!.unborns![i].isEnter ?? false)
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
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    controller.to04();
                  },
                style: GlobalStyle.setTextStyle(
                    'h2',
                    'bold',
                    (controller.dueDate.value != controller.orgDueDate.value)
                        ? GlobalStyle.orot_primary
                        : GlobalStyle.orot_gray_lighter,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalStyle.orot_gray_lighter,
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            controller.to05();
                          },
                        style: GlobalStyle.setTextStyle(
                            'h2',
                            'bold',
                            (controller.displayDiseasePreName.value !=
                                    controller.orgDisplayDiseasePreName.value)
                                ? GlobalStyle.orot_primary
                                : GlobalStyle.orot_gray_lighter,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_gray_lighter,
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            controller.to05();
                          },
                        style: GlobalStyle.setTextStyle(
                            'h2',
                            'bold',
                            (controller.member?.preDisease !=
                                    controller.orgMember?.preDisease)
                                ? GlobalStyle.orot_primary
                                : GlobalStyle.orot_gray_lighter,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_gray_lighter,
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            controller.to06();
                          },
                        style: GlobalStyle.setTextStyle(
                            'h2',
                            'bold',
                            (controller.displayDiseaseAfterName.value !=
                                    controller.orgDisplayDiseaseAfterName.value)
                                ? GlobalStyle.orot_primary
                                : GlobalStyle.orot_gray_lighter,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_gray_lighter,
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            controller.to06();
                          },
                        style: GlobalStyle.setTextStyle(
                            'h2',
                            'bold',
                            (controller.member?.afterDisease !=
                                    controller.orgMember?.afterDisease)
                                ? GlobalStyle.orot_primary
                                : GlobalStyle.orot_gray_lighter,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalStyle.orot_gray_lighter,
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
      Container(
        padding: EdgeInsets.only(top: 74.h, bottom: 0.h),
        child: GestureDetector(
          onTap: () {
            if (controller.isCanNext()) {
              controller.toNext();
            }
          },
          child: Container(
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: controller.isCanNext()
                  ? GlobalStyle.orot_primary
                  : GlobalStyle.orot_gray_lighter,
              borderRadius: BorderRadius.circular(24.0.h),
            ),
            child: Text("수정",
                style: GlobalStyle.setTextStyle(
                    'h4', 'bold', GlobalStyle.orot_white)),
          ),
        ),
      ),
    ]);
  }
}
