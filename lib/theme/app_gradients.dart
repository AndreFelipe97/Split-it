import 'dart:math';

import 'package:flutter/widgets.dart';

abstract class AppGradients {
  Gradient get background;
}

class AppGradietsDefault implements AppGradients {
  @override
  Gradient get background => LinearGradient(
      colors: [Color(0xFF40B38C), Color(0xFF45CC93)],
      transform: GradientRotation(3.35619 * pi));
}
