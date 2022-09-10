import 'package:note_app/common_libs.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;
  final bool? fullWidthButton;

  const DefaultButton(
      {super.key, this.onPressed, this.text, this.color, this.fullWidthButton});

  @override
  Widget build(BuildContext context) {
    return GFButton(
      borderShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      text: text,
      textStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 15,
          fontWeight: FontWeight.bold),
      size: context.height * 0.05,
      fullWidthButton: fullWidthButton ?? true,
      color: color ?? const Color(0xFF937DC2),
    );
  }
}
