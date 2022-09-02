// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController xController,
    required this.hintText,
    required this.icon,
  })  : xController = xController,
        super(key: key);

  final TextEditingController xController;
  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: xController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
        prefixIcon: icon,
      ),
    );
  }
}
