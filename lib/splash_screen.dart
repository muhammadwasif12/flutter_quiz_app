import 'dart:async';
import 'package:flutter/material.dart';
import 'quiz_ui.dart';
import 'gradient_container.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Change duration if needed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizUi()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Gradient_Container(
            Colors.purple,
            Colors.deepPurple.shade900,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 200, // Adjust size
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome to Flutter Quiz",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
