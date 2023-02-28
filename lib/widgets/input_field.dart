// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom_clone/utilities/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: controller,
        maxLines: 1,
        textAlign: TextAlign.center,
        keyboardType: inputType,
        decoration: InputDecoration(
          fillColor: secondaryBackgroundColor,
          filled: true,
          hintText: hintText,
          contentPadding: EdgeInsets.only(top: 10.0),
        ),
      ),
    );
  }
}
