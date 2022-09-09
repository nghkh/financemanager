import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? labelText;
  final String? hintText;
  final bool autoFocus;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int minLines;
  final int maxLines;
  final bool obscureText;
  final TextAlign textAlign;

  const AppTextField({
    Key? key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.autoFocus = false,
    this.onSubmitted,
    this.onChanged,
    this.suffixIcon,
    this.minLines = 1,
    this.maxLines = 1,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    this.hintText, this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus,
      obscureText: obscureText,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: minLines > maxLines ? minLines : maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
