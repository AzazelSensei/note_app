import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DefaultActionPane extends ActionPane {
  DefaultActionPane({
    super.key,
    super.dismissible,
    required void Function(BuildContext)? onPressed,
    Color backgroundColor = Colors.transparent,
    Color? foregroundColor,
    IconData? icon,
    String? label,
  }) : super(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              autoClose: false,
              onPressed: onPressed,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              icon: icon,
              label: label,
            ),
          ],
        );
}
