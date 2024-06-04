import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;

  const AppTextButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.backgroundColor,
      this.borderRadius,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonHeight,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                backgroundColor ?? const Color(0xFF00367E)),
            overlayColor: const WidgetStatePropertyAll(Colors.black),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16.0))),
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                horizontal: horizontalPadding ?? 12,
                vertical: verticalPadding ?? 14)),
            fixedSize: WidgetStatePropertyAll(
                Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.w600),
        ));
  }
}
