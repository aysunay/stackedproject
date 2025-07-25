import 'dart:ui';
import 'package:flutter/cupertino.dart';

extension ColorExtensions on Color {
  Color changeColorHue(double newHue) => HSLColor.fromColor(this).withHue(newHue).toColor();

  Color changeColorSaturation(double newSaturation) => HSLColor.fromColor(this).withSaturation(newSaturation).toColor();

  Color changeColorLightness(double newLightness) => HSLColor.fromColor(this).withLightness(newLightness).toColor();
}
