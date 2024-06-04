import 'package:electro_fix_application/features/authentication/login/presentation_layer/screens/login.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already Have An Account?  ",
          style: TextStyle(
              fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        InkWell(
          child: const Text(
            "Sign In",
            style: TextStyle(
                fontSize: 13, color: Colors.teal, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        )
      ],
    );
  }
}
