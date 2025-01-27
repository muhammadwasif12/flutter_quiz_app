import 'package:flutter/material.dart';
import 'dart:math';
import 'GradientManager.dart'; // Import the gradient manager

class DiceRollerUi extends StatefulWidget {
  @override
  State<DiceRollerUi> createState() => _DiceRollerUiState();
}

class _DiceRollerUiState extends State<DiceRollerUi> {
  int diceroller = 1;
  LinearGradient backgroundGradient = GradientManager.getRandomGradient(); // Initial gradient

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Dice Roller",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500), // Smooth transition for gradient
        decoration: BoxDecoration(
          gradient: backgroundGradient, // Dynamic gradient background
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Image.asset(
                  "assets/images/dice-$diceroller.png",
                  width: 200,
                  fit: BoxFit.cover,
                  key: ValueKey(diceroller),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    diceroller = Random().nextInt(6) + 1; // Roll the dice
                    backgroundGradient = GradientManager.getRandomGradient(); // Change gradient
                  });
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  side: BorderSide(color: Colors.white, width: 2),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Roll Dice",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
