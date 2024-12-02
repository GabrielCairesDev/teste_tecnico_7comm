import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev_test/constants/system_colors.dart';
import 'package:flutter_dev_test/core/widgets/text_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldOtpWidget extends StatelessWidget {
  const TextFieldOtpWidget({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _list(controllers, focusNodes, context),
    );
  }

  List<Widget> _list(List<TextEditingController> controllers, List<FocusNode> focusNodes, BuildContext context) {
    return List.generate(
      controllers.length,
      (index) {
        return _item(index, controllers, focusNodes, context);
      },
    );
  }

  Container _item(int index, List<TextEditingController> controllers, List<FocusNode> focusNodes, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: (index == 0 || index == controllers.length) ? 0 : 8),
      width: 48.2.sp,
      height: 52.sp,
      child: TextFildWidget(
        labelText: '',
        controller: controllers[index],
        focusNode: focusNodes[index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: SystemColors.fillBorderColor)),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          _onChanged(value, index, context, controllers);
          onChanged(controllers.map((controller) => controller.text).join());
        },
      ),
    );
  }

  void _onChanged(String value, int index, BuildContext context, List<TextEditingController> controllers) {
    if (value.isNotEmpty && index < controllers.length - 1) {
      FocusScope.of(context).nextFocus();
    }
  }
}
