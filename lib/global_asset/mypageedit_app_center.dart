import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_style.dart';

class MypPageEditAppCenter extends StatelessWidget
    implements PreferredSizeWidget {
  const MypPageEditAppCenter({
    Key? key,
    this.displayName,
    this.displayNameSub,
    this.isShowMenu = false,
    this.back,
    this.saved,
    this.actions,
  }) : super(key: key);
  final String? displayName;
  final String? displayNameSub;
  final bool? isShowMenu;
  final void Function()? back;
  final void Function()? saved;
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
              width: Get.width - 110.w,
              padding: EdgeInsets.only(left: 30.w),
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
              onTap: saved ??
                  () {
                    Get.toNamed('MyInfo');
                  },
              child: Container(
                margin: EdgeInsets.only(right: 30.w),
                alignment: Alignment.center,
                width: 46.w,
                height: 24.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: GlobalStyle.orot_primary),
                child: Text(
                  displayNameSub ?? "",
                  style: GoogleFonts.notoSans(
                    textStyle: GlobalStyle.setTextStyle(
                        'h6', "medium", GlobalStyle.orot_bg),
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
