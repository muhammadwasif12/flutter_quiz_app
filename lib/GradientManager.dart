import 'package:flutter/material.dart';
import 'dart:math';

class GradientManager {
  static final List<List<Color>> gradients = [
    [Colors.orange, Colors.yellow],
    [Colors.purple, Colors.pink],
    [Colors.deepPurple, Colors.pink],
    [Colors.red, Colors.deepOrange],
    [Colors.pink, Colors.purpleAccent],
    [Colors.red, Colors.purple],
  ];

  // Function to get a random gradient
  static LinearGradient getRandomGradient() {
    Random random = Random();
    final gradientColors = gradients[random.nextInt(gradients.length)];
    return LinearGradient(
      colors: gradientColors,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
}
