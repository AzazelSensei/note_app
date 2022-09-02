import 'package:flutter/material.dart';
import 'package:note_app/core/extension/ui_extension.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.normalWidth * 0.6,
      child: const Image(image: AssetImage('assets/priv_notes_logo.png')),
    );
  }
}
