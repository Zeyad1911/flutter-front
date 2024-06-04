import 'package:flutter/material.dart';

class ElectroFixNameAndLogo extends StatelessWidget {
  const ElectroFixNameAndLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/8.png"),
        const SizedBox(
          width: 8,
        ),
        const Text(
          "Electro Fix",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
        )
      ],
    );
  }
}
