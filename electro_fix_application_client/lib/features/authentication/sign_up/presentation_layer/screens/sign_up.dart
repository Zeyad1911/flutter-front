// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_fix_application/core/widgets/app_text_button.dart';
import 'package:electro_fix_application/core/widgets/app_text_form_field.dart';
import 'package:electro_fix_application/core/widgets/terms_and_conditions.dart';
import 'package:electro_fix_application/features/authentication/login/presentation_layer/screens/login.dart';
import 'package:electro_fix_application/features/authentication/sign_up/presentation_layer/widgets/already_have_an_account.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isobscureText = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> registerUser() async {
    if (formState.currentState!.validate()) {
      DocumentReference docRef =
          await FirebaseFirestore.instance.collection('Users').add({
        'username': usernameController.text,
        'email': emailController.text,
        'phoneNumber': phoneNumberController.text,
        'location': locationController.text,
        'password': passwordController.text,
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(
            userID: docRef.id,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all the fields with valid values.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our repairing community!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    AppTextFormField(
                      hintText: "username",
                      controller: usernameController,
                      prefixIcon: const Icon(Icons.person),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid username";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter a valid phone number";
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.phone_android_outlined),
                      hintText: "Phone number",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      hintText: "Location",
                      controller: locationController,
                      prefixIcon: const Icon(Icons.location_on),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid location";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextFormField(
                      controller: passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter a valid password";
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: "Password",
                      isobscureText: isobscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isobscureText = !isobscureText;
                          });
                        },
                        child: Icon(isobscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                AppTextButton(
                  buttonText: "Create Account",
                  backgroundColor: Colors.teal,
                  onPressed: registerUser,
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 25,
                ),
                const TermsAndConditionsText(),
                const SizedBox(
                  height: 25,
                ),
                const Center(
                  child: AlreadyHaveAnAccount(),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
