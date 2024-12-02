import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constants/img_files.dart';
import 'package:flutter_dev_test/constants/svg_files.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BodyTopWidget extends StatelessWidget {
  const BodyTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _backGroundLines(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: _logo(),
        ),
      ],
    );
  }

  Padding _backGroundLines() {
    return Padding(
      padding: EdgeInsets.only(top: 93.sp),
      child: SvgPicture.asset(
        SvgSystemFiles.lineBackGround,
        width: 1.sw,
      ),
    );
  }

  Padding _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 72.sp),
      child: Image.asset(
        height: 222.sp,
        ImgFiles.logo,
      ),
    );
  }
}
