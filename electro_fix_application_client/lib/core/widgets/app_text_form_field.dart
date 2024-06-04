import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isobscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isobscureText,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: inputTextStyle ??
          const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFDFDFF),
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(width: 1.3, color: Colors.teal)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide:
                    const BorderSide(width: 1.3, color: Color(0xffEDEDED))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(width: 1.3, color: Colors.red)),
        hintText: hintText,
        hintStyle: hintStyle ??
            const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9E9E9E)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      obscureText: isobscureText ?? false,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
    );
  }
}
