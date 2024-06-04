// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_fix_application/core/widgets/app_text_button.dart';
import 'package:electro_fix_application/core/widgets/app_text_form_field.dart';
import 'package:electro_fix_application/features/authentication/login/presentation_layer/widgets/do_you_want_to_register.dart';
import 'package:electro_fix_application/core/widgets/terms_and_conditions.dart';
import 'package:electro_fix_application/navigation_bar_menu.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.userID});

  final String? userID;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  bool isobscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome back",
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
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Your email is incorrect";
                          }
                          return null;
                        },
                        controller: emailController,
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Your password is incorrect";
                          }
                          return null;
                        },
                        controller: passwordController,
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
                                : Icons.visibility)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                AppTextButton(
                  buttonText: "Login",
                  backgroundColor: Colors.teal,
                  onPressed: loginProcess,
                ),
                const SizedBox(
                  height: 40,
                ),
                const TermsAndConditionsText(),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: DoYouWantToRegister(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginProcess() async {
    bool userFound = false;

    if (formkey.currentState!.validate()) {
      if (widget.userID != null) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(widget.userID)
            .get();

        String email = documentSnapshot.get("email");
        String password = documentSnapshot.get("password");

        if (email == emailController.text &&
            password == passwordController.text) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationBarMenu(
                userID: widget.userID,
              ),
            ),
          );
        }

        if (!userFound) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Incorrect email or password."),
            ),
          );
        }
      } else {
        QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection("Users").get();

        for (QueryDocumentSnapshot documentReference in querySnapshot.docs) {
          if (documentReference.get("email") == emailController.text &&
              documentReference.get("password") == passwordController.text) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationBarMenu(
                  userID: documentReference.id,
                ),
              ),
            );

            userFound = true;
            break;
          }
        }
        if (!userFound) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Incorrect email or password."),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all the fields with valid values.'),
        ),
      );
    }
  }
}
