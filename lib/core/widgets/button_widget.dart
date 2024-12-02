import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constants/system_colors.dart';
import 'package:flutter_dev_test/constants/text_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.color = TextColors.invert,
    this.enabled = true,
  });

  final String text;
  final Function()? onTap;
  final Color color;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: _backGroud(context),
    );
  }

  Container _backGroud(BuildContext context) {
    return Container(
      height: 48.sp,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: enabled ? SystemColors.primaryColor : SystemColors.primaryColor.withOpacity(0.5),
      ),
      child: _text(context),
    );
  }

  Center _text(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
