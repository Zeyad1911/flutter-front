import 'package:electro_fix_application/core/theme/colors.dart';
import 'package:electro_fix_application/core/widgets/delete_button.dart';
import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  final String userName;
  final String deviceType;
  final String deviceDescription;
  final String location;
  final String address;
  const CardPost({
    super.key,
    required this.userName,
    required this.deviceType,
    required this.deviceDescription,
    required this.location,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: ColorManager.mainColor,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      address,
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[400]),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              deviceType,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              deviceDescription,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                DeleteButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
