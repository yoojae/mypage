import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepBar extends StatelessWidget {
  const StepBar({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 6; i++)
          i < currentIndex
              ? SvgPicture.asset(
                  'images/svg/bar_step_on.svg',
                  width: 58.w,
                )
              : SvgPicture.asset('images/svg/bar_step_off.svg', width: 58.w),
      ],
    );
  }
}
