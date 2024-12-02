import 'package:flutter/material.dart';

import 'package:flutter_dev_test/constants/system_colors.dart';
import 'package:flutter_dev_test/constants/text_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarUtils {
  static void show(BuildContext context, {required String message}) {
    final snackBar = SnackBar(
      content: _content(SystemColors.snackBar, message, context),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Container _content(Color backgroundColor, String message, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 8.sp),
      height: 56.sp,
      decoration: _contentDecoration(backgroundColor),
      child: _text(message, context),
    );
  }

  static BoxDecoration _contentDecoration(Color backgroundColor) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
    );
  }

  static Align _text(String message, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        message,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: TextColors.invert),
      ),
    );
  }
}
