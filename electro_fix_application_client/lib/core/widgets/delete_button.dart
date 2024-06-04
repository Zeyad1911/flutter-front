import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:  MaterialStatePropertyAll(Colors.red[800]),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        overlayColor: MaterialStatePropertyAll(Colors.grey[300]),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        ),
        minimumSize: const MaterialStatePropertyAll(Size(90, 20)),
      ),
      child: const Text(
        "Delete",
        style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }
}
