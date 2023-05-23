import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/member.dart';
import 'global_style.dart';

class MypPageAppCenter extends StatelessWidget implements PreferredSizeWidget {
  const MypPageAppCenter({
    Key? key,
    this.displayName,
    this.displayNameSub,
    this.isShowMenu = false,
    this.back,
    this.actions,
    this.gotoMember,
  }) : super(key: key);
  final String? displayName;
  final String? displayNameSub;
  final bool? isShowMenu;
  final void Function()? back;
  final void Function()? gotoMember;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Get.width - 100.w,
              alignment: Alignment.center,
              child: Text(
                displayName ?? "",
                style: GoogleFonts.notoSans(
                  textStyle: GlobalStyle.setTextStyle(
                      'h3', "semi_bold", GlobalStyle.orot_black),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            GestureDetector(
              onTap: gotoMember ??
                  () {
                    Get.toNamed('/MyInfoEdit');
                  },
              child: Container(
                padding: EdgeInsets.only(right: 30.w),
                child: Text(
                  displayNameSub ?? "",
                  style: GoogleFonts.notoSans(
                    textStyle: GlobalStyle.setTextStyle(
                        'h6', "medium", GlobalStyle.orot_black),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      leading: GestureDetector(
        onTap: back ??
            () {
              Get.back();
            },
        child: SvgPicture.asset(
          'images/svg/btn_all_before_medium.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
      titleSpacing: -10.w,
      elevation: 0.0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
