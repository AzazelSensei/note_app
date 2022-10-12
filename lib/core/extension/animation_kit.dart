import 'package:flutter/material.dart';
import 'package:note_app/core/components/animation/component_animation.dart';

extension AnimatedKit on Widget {
  Widget addDropFade({required double delay}) => FadeAnimation(
        delay: delay,
        child: this,
      );
}
