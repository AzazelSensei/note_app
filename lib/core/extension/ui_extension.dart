import 'package:flutter/material.dart';

extension UIEx on BuildContext {
  Size get toSize => MediaQuery.of(this).size;
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get lowPadding => EdgeInsets.all(toSize.height * 0.09);
  EdgeInsets get normalPadding => EdgeInsets.all(toSize.height * 0.12);
  EdgeInsets get largePadding => EdgeInsets.all(toSize.height * 0.2);

  EdgeInsets get lowHorPadding =>
      EdgeInsets.symmetric(horizontal: toSize.height * 0.02);
  EdgeInsets get normalHorPadding =>
      EdgeInsets.symmetric(horizontal: toSize.height * 0.06);
  EdgeInsets get largeHorPadding =>
      EdgeInsets.symmetric(horizontal: toSize.height * 0.2);

  EdgeInsets get lowVerPadding =>
      EdgeInsets.symmetric(vertical: toSize.height * 0.02);
  EdgeInsets get normalVerPadding =>
      EdgeInsets.symmetric(vertical: toSize.height * 0.06);
  EdgeInsets get largeVerPadding =>
      EdgeInsets.symmetric(vertical: toSize.height * 0.2);

  EdgeInsets get left => EdgeInsets.only(left: toSize.height * 0.02);
  EdgeInsets get right => EdgeInsets.only(right: toSize.height * 0.02);
  EdgeInsets get top => EdgeInsets.only(top: toSize.height * 0.02);
  EdgeInsets get bottom => EdgeInsets.only(bottom: toSize.height * 0.02);

  EdgeInsets get rightBottom => EdgeInsets.only(
      bottom: toSize.height * 0.02, right: toSize.height * 0.02);

  EdgeInsets get lowSymAllPadding => EdgeInsets.symmetric(
      horizontal: toSize.height * 0.02, vertical: toSize.height * 0.018);
  EdgeInsets get normalSymAllPadding => EdgeInsets.symmetric(
      horizontal: toSize.height * 0.12, vertical: toSize.height * 0.12);
  EdgeInsets get largeSymAllPadding => EdgeInsets.symmetric(
      horizontal: toSize.height * 0.2, vertical: toSize.height * 0.2);

  double get lowHeight => toSize.height * 0.025;
  double get normalHeight => toSize.height * 0.05;
  double get largeHeight => toSize.height * 0.07;

  double get lowWidth => toSize.width * 0.025;
  double get normalWidth => toSize.width * 0.5;
  double get largeWidth => toSize.width * 0.7;

  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  //UIEx boş yere yazarak call edilebilir
  ThemeData get theme => Theme.of(this);

  BorderRadius get normalBorderRadius =>
      BorderRadius.all(Radius.circular(toSize.width * 0.05));
  BorderRadius get lowBorderRadius =>
      BorderRadius.all(Radius.circular(toSize.width * 0.02));
  BorderRadius get highBorderRadius =>
      BorderRadius.all(Radius.circular(toSize.width * 0.1));

  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  RoundedRectangleBorder get roundedRectangleBorderLow =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(lowValue)));

  RoundedRectangleBorder get roundedRectangleAllBorderNormal =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(normalValue));

  RoundedRectangleBorder get roundedRectangleBorderNormal =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(normalValue)));

  RoundedRectangleBorder get roundedRectangleBorderMedium =>
      RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(mediumValue)));

  RoundedRectangleBorder get roundedRectangleBorderHigh =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(highValue)));
}
