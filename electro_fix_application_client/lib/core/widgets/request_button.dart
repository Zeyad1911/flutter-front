import 'package:flutter/material.dart';

class RequestButton extends StatelessWidget {
  final String name;
  const RequestButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.teal),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        overlayColor: WidgetStatePropertyAll(Colors.grey[300]),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(90, 20)),
      ),
      child: const Text(
        "Request",
        style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }
}
