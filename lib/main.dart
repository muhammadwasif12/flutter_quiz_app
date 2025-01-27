import 'package:flutter/material.dart';
import 'DiceRollerUi.dart';
import 'dart:math';
import 'GradientManager.dart';

void main() {
  runApp(DiceRoller());
}

class DiceRoller extends StatefulWidget {
  DiceRollerState createState() => DiceRollerState();
}

class DiceRollerState extends State<DiceRoller> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice Roller App",
      home: DiceRollerUi(),
    );
  }
}
