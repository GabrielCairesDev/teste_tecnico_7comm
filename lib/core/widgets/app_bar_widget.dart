import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constants/svg_files.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => onTap(context),
        icon: _icon(),
      ),
    );
  }

  Padding _icon() {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: SvgPicture.asset(
        SvgIconFiles.back,
        height: 24.sp,
      ),
    );
  }

  void onTap(BuildContext context) {
    Navigator.pop(context);
  }
}
