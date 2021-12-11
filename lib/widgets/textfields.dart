import 'package:flutter/material.dart';

class TextFieldswidget extends StatelessWidget {
  const TextFieldswidget({
     Key? key,
    required this.controller,
    required this.hintText,
    required this.secureText,
    required this.helperText
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool secureText;
  final String helperText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: secureText,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.arrow_forward),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.deepPurple,
            fontSize: 15,
            //fontStyle: FontStyle.bold
          ),
          helperText: helperText,
          helperStyle: const TextStyle(
            color: Colors.deepPurple,
            fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)
            ),
            focusedBorder:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(50)
                )
                ),
    );
  }
}
