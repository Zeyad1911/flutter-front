import 'package:electro_fix_application/core/theme/colors.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  final List<String> choices;
  final void Function(String?) onSelectionChanged;
  const DropDownButton({
    super.key,
    required this.choices, required this.onSelectionChanged,
  });

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          minWidth: 100,
          buttonColor: Colors.yellow,
          highlightColor: Colors.yellow,
          alignedDropdown: true,
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            dropdownColor: ColorManager.backgroundcolorofformfield,
            hint: const Text("Select type of your device"),
            value: selectedItem,
            items: widget.choices.map((String deviceType) {
              return DropdownMenuItem<String>(
                value: deviceType,
                child: Text(deviceType),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue;
                widget.onSelectionChanged(newValue);
              });
            },
          ),
        ),
      ),
    );
  }
}
