import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:orot/controller/mypage/inquiry_history_controller.dart';

import 'package:orot/global_asset/global_style.dart';

class InquiryHistoryPage extends GetView<InquiryHistoryController> {
  const InquiryHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: HistoryList(
            type: '접수',
            title: '문의 제목 예시 텍스트입니다.',
            detail:
                '못하다 있음으로써 그들의 힘차게 끓는다. 있을 실로 있는 길지 황금시대를 이것이다. 인간에 거친 풀이 피어나기 같이, 꽃이 소리다.이것은 이 말이다. 크고 무한한이다. 것은 그와 방황하여도, 이는 이 목숨이 석가는있다.',
            answer:
                '곳으로 아름답고 가진 실현에 끓는 하는 영락과 같으며, 속에서 아름다우냐? 보이는 그것은 원대하고, 품었기                 이상이 불어 이상은 너의 거친 보라. 이 능히 뜨고,구할 소리다.이것은 것은 말이다. 하여도 가지에 꾸며그것은 두기 이상의 용감하고 청춘 것이다.',
            date: '2023.04.06 10:00',
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12.h, bottom: 48.h),
          child: Text(
            '최근 1년간 문의내역만 조회 가능합니다.',
            style: TextStyle(
              color: Color(0xffbfccd9),
              fontSize: 12,
              fontFamily: 'Pretendard',
            ),
          ),
        )
      ],
    );
  }
}

class HistoryList extends StatefulWidget {
  const HistoryList(
      {Key? key,
      required this.type,
      required this.title,
      required this.detail,
      required this.answer,
      required this.date})
      : super(key: key);

  final String type, title, detail, answer, date;

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ExpansionTile(
          tilePadding: EdgeInsets.only(top: 25.h),
          onExpansionChanged: (value) {
            setState(() {
              _isExpanded = value;
            });
          },
          trailing: AnimatedRotation(
            turns: _isExpanded ? .5 : 0,
            duration: Duration(seconds: 0),
            child: RotatedBox(
              quarterTurns: 1,
              child: SvgPicture.asset('images/svg/arrow_forward.svg'),
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: Color(0xffc5bcf5).withOpacity(0.9957590103149414),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    widget.type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Text(
                widget.date,
                style: TextStyle(
                  color: Color(0xff475259),
                  fontSize: 13,
                  fontFamily: 'Pretendard',
                ),
              ),
            ],
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 16.h, bottom: 24.h, left: 8.w),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Color(0xff1e2225),
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            ),
          ),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              title: Container(
                margin: EdgeInsets.only(left: 8.w, right: 10.w, bottom: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.detail,
                      style: TextStyle(
                          color: Color(0xff475259),
                          fontFamily: 'Pretendard',
                          fontSize: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 33.h, bottom: 16.h),
                      child: Text(
                        '오롯 c/s팀의 답변',
                        style: TextStyle(
                            color: Color(0xff1e2225),
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                    ),
                    Text(
                      widget.answer,
                      style: TextStyle(
                          color: Color(0xff475259),
                          fontFamily: 'Pretendard',
                          fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 0,
      ),
      itemCount: 3,
    );
  }
}
