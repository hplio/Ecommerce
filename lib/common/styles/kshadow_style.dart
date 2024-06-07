import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class ShadowStyle {
  ShadowStyle._();
  
  static final verticalProductShadow = BoxShadow(
    color: TColor.darkGrey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );


  static final horizontalProductShadow = BoxShadow(
    color: TColor.darkGrey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
