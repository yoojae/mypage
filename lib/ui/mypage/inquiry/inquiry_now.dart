import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:orot/controller/mypage/inquiry_now_controller.dart';

import 'package:orot/global_asset/global_style.dart';

class InquiryNowPage extends GetView<InquiryNowController> {
  const InquiryNowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 48.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputForm(
              txt: '성함',
              hint: '본명을 입력하세요',
              color: Colors.transparent,
            ),
            InputForm(
              txt: '이메일',
              hint: '이메일을 입력하세요',
              color: GlobalStyle.orot_primary,
            ),
            CategoryForm(),
            InputForm(
              txt: '제목',
              hint: '제목을 입력하세요',
              color: GlobalStyle.orot_primary,
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('내용',
                      style: GlobalStyle.setTextStyle(
                          'h4', 'semi_bold', GlobalStyle.orot_black)),
                  Container(
                    margin: EdgeInsets.only(top: 5.h, left: 3.w),
                    width: 4.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: GlobalStyle.orot_primary,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.h),
              height: 187.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: GlobalStyle.orot_gray_lightest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                // onChanged: (value) {

                // },
                textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLines: null,
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_black),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                  counterText: '',
                  border: InputBorder.none,
                  hintText: '내용을 입력해주세요',
                  hintStyle: GlobalStyle.setTextStyle(
                      'h4', 'medium', GlobalStyle.orot_gray_dark),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '첨부파일',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'semi_bold', GlobalStyle.orot_black),
                  ),
                  Container(
                    height: 8.h,
                  ),
                  Text(
                    '이미지 파일(GIF, PNG, JPG)을 기준으로 최대 00MB이하,',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: GlobalStyle.orot_gray_darkest,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  Container(
                    height: 8.h,
                  ),
                  Text(
                    '최대 3개까지 등록 가능합니다.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: GlobalStyle.orot_gray_darkest,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  Upload(),
                ],
              ),
            ),
            Info(
                title: '운영시간',
                subtitle: '평일 10:00 - 18:00',
                endtitle: '점심시간 12:00 - 13:00 / 토,일,공휴일 휴무'),
            Container(
              height: 32.h,
            ),
            Info(
                title: '상담 이용방법',
                subtitle: '진행 중인 문의가 많을 경우 응답이 지연될 수 있습니다.',
                endtitle: '최대한 빠르게 도움 드릴 수 있도록 노력하겠습니다.'),
            Term(),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 28.h),
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: GlobalStyle.orot_gray_lighter,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    '문의',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'bold', GlobalStyle.orot_white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm(
      {Key? key, required this.txt, required this.hint, required this.color})
      : super(key: key);

  final String txt, hint;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style: GlobalStyle.setTextStyle(
                    'h4', 'semi_bold', GlobalStyle.orot_black),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h, left: 3.w),
                width: 4.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          height: 48.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: GlobalStyle.orot_gray_lightest,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: TextField(
            // onChanged: (value) {

            // },
            textAlign: TextAlign.left,
            maxLength: 10,
            style: GlobalStyle.setTextStyle(
                'h4', 'medium', GlobalStyle.orot_black),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 24.w),
              counterText: '',
              border: InputBorder.none,
              hintText: hint,
              hintStyle: GlobalStyle.setTextStyle(
                  'h4', 'medium', GlobalStyle.orot_gray_dark),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryForm extends StatefulWidget {
  const CategoryForm({Key? key}) : super(key: key);

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  String? dropdownvalue;

  var category = [
    '건강기록',
    '감정기록',
    '식단기록',
    '고위험 임산부',
    '임산부',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '카테고리',
                style: GlobalStyle.setTextStyle(
                    'h4', 'semi_bold', GlobalStyle.orot_black),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h, left: 3.w),
                width: 4.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: GlobalStyle.orot_primary,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          height: 48.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: GlobalStyle.orot_gray_lightest,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: DropdownButton(
            hint: Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                '선택 안 함',
                style: GlobalStyle.setTextStyle(
                    'h4', 'medium', GlobalStyle.orot_gray_dark),
              ),
            ),
            value: dropdownvalue,
            icon: Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Icon(Icons.keyboard_arrow_down),
            ),
            selectedItemBuilder: (BuildContext context) {
              return category.map((String value) {
                return Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dropdownvalue = value,
                      style: TextStyle(color: GlobalStyle.orot_black),
                    ),
                  ),
                );
              }).toList();
            },
            items: category.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Text(
                    items,
                    style: GlobalStyle.setTextStyle(
                        'h4', 'medium', GlobalStyle.orot_gray_dark),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue ?? "";
              });
            },
            isExpanded: true,
            underline: Container(),
            style: GlobalStyle.setTextStyle(
                'h4', 'medium', GlobalStyle.orot_black),
            dropdownColor: GlobalStyle.orot_gray_lightest,
            iconEnabledColor: GlobalStyle.orot_gray_dark,
            iconDisabledColor: GlobalStyle.orot_black,
          ),
        ),
      ],
    );
  }
}

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
    );
    List<XFile> xfilePick = pickedFile;

    setState(() {
      if (xfilePick.isNotEmpty) {
        for (var i = 0; i < xfilePick.length; i++) {
          selectedImages.add(File(xfilePick[i].path));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            getImages();
          },
          child: Container(
            margin: EdgeInsets.only(
                top: 8.h, bottom: selectedImages.isEmpty ? 10.h : 12.h),
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: GlobalStyle.orot_gray_lightest,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Text('+ ',
                            style: GlobalStyle.setTextStyle(
                                'h6', 'semi_bold', GlobalStyle.orot_gray_dark)),
                        Text('파일 첨부',
                            style: GlobalStyle.setTextStyle(
                                'h6', 'semi_bold', GlobalStyle.orot_gray_dark)),
                      ],
                    ),
                  ),
                  Flexible(
                    // **---------- 아이콘 SVG ----------**
                    flex: 1,
                    child: SvgPicture.asset('images/svg/attachment.svg'),
                  ),
                ],
              ),
            ),
          ),
        ),
        // **--------------- 이미지 미리 보기 ------------------*
        Container(
          width: double.infinity,
          height: selectedImages.isEmpty ? 0 : 64.h,
          padding: EdgeInsets.only(left: 8.w),
          child: selectedImages.isEmpty
              ? Container(
                  width: double.infinity,
                  height: 0,
                )
              : GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: selectedImages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // crossAxisSpacing: 0,
                    // mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: Image.file(
                            selectedImages[index],
                            fit: BoxFit.cover,
                            width: 64.w,
                            height: 64.h,
                          ),
                        ),
                        Positioned(
                          top: 4.h,
                          left: 47.w,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: 12.w,
                                height: 12.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: GlobalStyle.orot_black),
                                child: Center(
                                    child: Icon(
                                  Icons.close,
                                  color: GlobalStyle.orot_white,
                                  size: 8.sp,
                                ))),
                          ),
                        )
                      ],
                    );
                  },
                ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: selectedImages.isEmpty ? 0 : 8.h, bottom: 8.h),
          child: Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '0MB',
                    style: TextStyle(
                      color: GlobalStyle.orot_primary,
                      fontSize: 12.sp,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  TextSpan(
                    text: ' / 00MB',
                    style: TextStyle(
                      color: GlobalStyle.orot_gray_darkest,
                      fontSize: 12.sp,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              ),
              // style: TextStyle(
              //   color: Color(0xff7a65e8),
              //   fontSize: 12,
              //   fontFamily: 'Pretendard',
              // ),
            ),
          ),
        ),
      ],
    );
  }
}

class Info extends StatelessWidget {
  const Info(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.endtitle})
      : super(key: key);

  final String title, subtitle, endtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GlobalStyle.setTextStyle(
                'h4', 'semi_bold', GlobalStyle.orot_black)),
        Container(
          height: 8.h,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontFamily: 'Pretendard', color: GlobalStyle.orot_gray_darkest),
        ),
        Container(
          height: 8.h,
        ),
        Text(
          endtitle,
          style: TextStyle(
              fontFamily: 'Pretendard', color: GlobalStyle.orot_gray_darkest),
        ),
      ],
    );
  }
}

class Term extends StatelessWidget {
  const Term({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 44.h,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  child: Icon(
                Icons.check_rounded,
                color: GlobalStyle.orot_primary_lighter,
                size: 24.sp,
              )),
            ),
          ),
          Expanded(
            child: Flexible(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                        child: Text(
                      ' [필수] 개인정보 수집 및 이용약관 동의',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: GlobalStyle.orot_gray_darkest),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Flexible(
                      flex: 1,
                      child: Container(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: GlobalStyle.orot_gray_darkest,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
