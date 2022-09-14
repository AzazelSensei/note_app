import 'package:note_app/common_libs.dart';

class DefaultTextField extends TextField {
  DefaultTextField({
    super.key,
    super.controller,
    super.maxLines,
    String hintText = "Title",
  }) : super(
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        );
}
