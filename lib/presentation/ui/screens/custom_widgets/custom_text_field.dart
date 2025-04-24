import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelName,
    required this.controller,
  });
  final String labelName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          labelName,
          style: Theme.of(context).textTheme.headlineMedium,
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
