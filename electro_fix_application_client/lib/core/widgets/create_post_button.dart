import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_fix_application/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CreatePostButton extends StatefulWidget {
  const CreatePostButton(
      {super.key,
      required this.description,
      required this.location,
      required this.address,
      required this.deviceType,
      this.userID});

  final String? description;
  final String? location;
  final String? address;
  final String? deviceType;
  final String? userID;

  @override
  State<CreatePostButton> createState() => _CreatePostButtonState();
}

class _CreatePostButtonState extends State<CreatePostButton> {
  List<String> allPosts = [];

  Future<void> createPost() async {
    DocumentReference documentReference =
        await FirebaseFirestore.instance.collection("UserPosts").add({
      "deviceType": widget.deviceType,
      "description": widget.description,
      "location": widget.location,
      "address": widget.address,
      "timeStamp": DateTime.now(),
      "userID": widget.userID
    });

    allPosts.add(documentReference.id);

    FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.userID)
        .update({
          "myPosts" : allPosts
        });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: createPost,
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
        "Create Post",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
