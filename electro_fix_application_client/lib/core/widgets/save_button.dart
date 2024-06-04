import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final String name;
  const SaveButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.save_alt_rounded),
      label: const Text(
        "Save",
        style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.teal),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        iconColor: const WidgetStatePropertyAll(Colors.white),
        iconSize: const WidgetStatePropertyAll(20),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(100, 20)),
        overlayColor: WidgetStatePropertyAll(Colors.grey[300]),
      ),
    );
  }
}
