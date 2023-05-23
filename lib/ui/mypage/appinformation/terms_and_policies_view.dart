import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orot/controller/mypage/terms_and_policies_view_controller.dart';
import 'package:orot/global_asset/app_center_title.dart';

import 'package:orot/global_asset/mypage_app_center.dart';

import 'package:orot/global_asset/common.dart';
import 'package:orot/global_asset/global_style.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:orot/ui/mypage/notice/notice_list.dart';

//PageId :li01010000p
class TermsAndPoliciesView extends GetView<TermsAndPoliciesViewController> {
  TermsAndPoliciesView({Key? key}) : super(key: key);

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20.h,
                    ),
                    Text(
                      '[필수] 오롯 서비스 이용약관 동의',
                      style: GlobalStyle.setTextStyle(
                          'h3', 'bold', GlobalStyle.orot_black),
                    ),
                    Container(
                      height: 16.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: GlobalStyle.orot_gray_lighter,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 48.h),
                  child: Text(
                    '여러분을 환영합니다. 오롯 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 오롯 서비스의 이용과 관련하여 오롯 서비스를 제공하는 오롯 주식회사(이하 ‘오롯’)와 이를 이용하는 오롯 또는 비회원과의 관계를 성명하며, 아울러 여러분의 오롯 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 오롯 서비스를 이용하시거나 오롯 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 오롯 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 오롯에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 오롯 회원가입 방법 등에서 확인해 주세요. 오롯은 단체에 속한 여러 구성원들이 공동의 계정으로 오롯 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.',
                    style: GlobalStyle.setTextStyle(
                        'h4', 'regular', GlobalStyle.orot_gray_darkest,
                        height: 2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
