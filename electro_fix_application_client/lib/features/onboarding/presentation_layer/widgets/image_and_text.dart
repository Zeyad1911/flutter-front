import 'package:flutter/material.dart';

class ImageAndText extends StatelessWidget {
  const ImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.14, 0.4])),
            child: Image.asset("assets/images/7.jpg")),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              "Best Technicians here",
              textAlign: TextAlign.center,
              style: const TextStyle(
                      fontSize: 34,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold)
                  .copyWith(height: 1.4),
            ))
      ],
    );
  }
}
