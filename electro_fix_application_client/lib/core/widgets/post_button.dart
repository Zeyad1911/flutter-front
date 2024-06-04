import 'package:electro_fix_application/core/theme/colors.dart';
import 'package:electro_fix_application/features/create_post/presentation_layer/screens/create_post_page.dart';
import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key, this.userID});

  final String? userID;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePost(
              userID: userID,
            ),
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.teal),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        overlayColor: WidgetStatePropertyAll(Colors.grey[300]),
        surfaceTintColor: const WidgetStatePropertyAll(ColorManager.mainColor),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(80, 30)),
      ),
      child: const Text(
        "Post",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
