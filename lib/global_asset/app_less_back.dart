import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_style.dart';

class AppLessBack extends StatelessWidget implements PreferredSizeWidget {
  const AppLessBack({
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
        child: Row(
          children: [
            Text(
              displayName ?? "",
              style: GoogleFonts.notoSans(
                textStyle: GlobalStyle.setTextStyle(
                    'h1', "w500", GlobalStyle.orot_black),
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.5.h, left: 12.5.w),
              child: Text(
                displayNameSub ?? "",
              ),
            )
          ],
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      automaticallyImplyLeading: false,
      titleSpacing: -10.w,
      elevation: 0.0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
