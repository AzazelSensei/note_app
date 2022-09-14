// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:note_app/common_libs.dart';

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
        hintText: hintText,
        prefixIcon: icon,
      ),
    );
  }
}
