import 'package:electro_fix_application/core/widgets/app_text_button.dart';
import 'package:electro_fix_application/features/authentication/login/presentation_layer/screens/login.dart';
import 'package:electro_fix_application/features/onboarding/presentation_layer/widgets/electrofix_name_and_logo.dart';
import 'package:electro_fix_application/features/onboarding/presentation_layer/widgets/image_and_text.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ElectroFixNameAndLogo(),
                const SizedBox(
                  height: 25,
                ),
                const ImageAndText(),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const Text(
                        "Search and choose best technician for your device any time any where",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextButton(
                        buttonText: "Get Started",
                        backgroundColor: Colors.teal,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
