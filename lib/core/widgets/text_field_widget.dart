import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev_test/constants/system_colors.dart';
import 'package:flutter_dev_test/constants/text_colors.dart';

class TextFildWidget extends StatelessWidget {
  const TextFildWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.focusNode,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.labelColor = TextColors.onBackGround,
    this.enabledBorder,
  });

  final String labelText;
  final TextEditingController controller;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Color labelColor;
  final InputBorder? enabledBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: SystemColors.primaryColor,
      controller: controller,
      focusNode: focusNode,
      maxLength: maxLength,
      keyboardType: keyboardType,
      onChanged: onChanged,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      decoration: _decoration(),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      counterText: '',
      filled: true,
      labelText: labelText,
      fillColor: SystemColors.fillColor,
      enabledBorder: enabledBorder ?? _enabledBorder(),
      focusedBorder: _focusedBorder(),
      labelStyle: _labelStyle(),
    );
  }

  OutlineInputBorder _enabledBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }

  OutlineInputBorder _focusedBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: SystemColors.primaryColor),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(
      color: labelColor,
    );
  }
}
