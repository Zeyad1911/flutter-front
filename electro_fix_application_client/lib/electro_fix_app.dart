import 'package:electro_fix_application/features/onboarding/presentation_layer/screens/on_boarding.dart';
import 'package:flutter/material.dart';

class ElectroFixApp extends StatelessWidget {
  const ElectroFixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client Electro Fix App',
      theme: ThemeData(
        primaryColor: const Color(0xFF00367E),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoarding(),
    );
  }
}
