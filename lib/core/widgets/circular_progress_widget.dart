import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constants/system_colors.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: SystemColors.primaryColor,
      ),
    );
  }
}
