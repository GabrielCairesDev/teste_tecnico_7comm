import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constants/svg_files.dart';
import 'package:flutter_dev_test/constants/text_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          SvgIconFiles.help,
          height: 20.sp,
        ),
        SizedBox(width: 8.sp),
        Text(
          'Precisa de ajuda?',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: TextColors.primary,
              ),
        )
      ],
    );
  }
}
