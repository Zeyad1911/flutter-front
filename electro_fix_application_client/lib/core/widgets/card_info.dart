import 'package:electro_fix_application/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CardInformation extends StatefulWidget {
  final String hintText;
  final String info;
  final Icon prefixIcon;

  const CardInformation({
    super.key,
    required this.hintText,
    required this.info,
    required this.prefixIcon,
  });

  @override
  State<CardInformation> createState() => _CardInformationState();
}

class _CardInformationState extends State<CardInformation> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.backgroundcolorofformfield,
      surfaceTintColor: ColorManager.backgroundcolorofformfield,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 1,
      child: ListTile(
        leading: widget.prefixIcon,
        title: Text(
          widget.hintText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(widget.info, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
