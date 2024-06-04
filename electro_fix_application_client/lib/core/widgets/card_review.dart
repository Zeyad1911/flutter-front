import 'package:electro_fix_application/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CardReview extends StatelessWidget {
  final String userName;
  final String reviewFeedback;
  const CardReview(
      {super.key, required this.userName, required this.reviewFeedback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.backgroundcolorofformfield,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: ColorManager.mainColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                userName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            reviewFeedback,
          )
        ],
      ),
    );
  }
}
