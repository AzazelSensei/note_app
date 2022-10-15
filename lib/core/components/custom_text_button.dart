import 'package:flutter/material.dart';
import 'package:note_app/core/init/theme/colors_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    this.onpressed,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final void Function()? onpressed;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: Text(
          (text),
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: ColorManager.white),
        ));
  }
}
