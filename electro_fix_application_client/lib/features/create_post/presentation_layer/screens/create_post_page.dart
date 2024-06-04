import 'package:electro_fix_application/core/widgets/app_text_form_field.dart';
import 'package:electro_fix_application/core/widgets/create_post_button.dart';
import 'package:electro_fix_application/core/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key, this.userID});

  final String? userID;

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final description = TextEditingController();
  final location = TextEditingController();
  final address = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final List<String> choices = [
    'TVs',
    "Refrigerator",
    "Washing Machines",
    'Air Conditioner',
    "Other Appliances"
  ];

  String? selectedDeviceType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text("Create Post"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView(
            children: [
              Form(
                key: formkey,
                child: Column(
                  children: [
                    DropDownButton(
                      choices: choices,
                      onSelectionChanged: (newValue) {
                        setState(() {
                          selectedDeviceType = newValue;
                        });
                      },
                    ),
                    AppTextFormField(
                      hintText: "Description",
                      controller: description,
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextFormField(
                      hintText: "Location",
                      controller: location,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextFormField(
                      hintText: "Address",
                      controller: address,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CreatePostButton(
                      description: description.text,
                      location: location.text,
                      address: address.text,
                      deviceType: selectedDeviceType,
                      userID: widget.userID,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
