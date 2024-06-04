import 'package:electro_fix_application/features/authentication/sign_up/presentation_layer/screens/sign_up.dart';
import 'package:flutter/material.dart';

class DoYouWantToRegister extends StatelessWidget {
  const DoYouWantToRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Do You Want To Register?  ",
          style: TextStyle(
              fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        InkWell(
          child: const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 13, color: Colors.teal, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
        )
      ],
    );
  }
}
