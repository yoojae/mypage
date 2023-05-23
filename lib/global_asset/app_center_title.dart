import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_style.dart';

class AppCenterTitle extends StatelessWidget implements PreferredSizeWidget {
  const AppCenterTitle({
    Key? key,
    this.displayName,
    this.displayNameSub,
    this.isShowMenu = false,
    this.back,
    this.actions,
  }) : super(key: key);
  final String? displayName;
  final String? displayNameSub;
  final bool? isShowMenu;
  final void Function()? back;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 0.w),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(right: 50.w),
            child: Text(
              displayName ?? "",
              style: GoogleFonts.notoSans(
                textStyle: GlobalStyle.setTextStyle(
                    'h3', "semi_bold", GlobalStyle.orot_black),
              ),
              textAlign: TextAlign.start,
            ),
          ),
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
