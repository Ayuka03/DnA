import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelName});
  final String labelName;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(
          labelName,
          style: TextStyle(color: const Color.fromARGB(179, 195, 54, 44)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 2.5,
            color: Color.fromARGB(50, 250, 64, 40),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Color.fromARGB(200, 250, 64, 40),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
