import 'package:flutter/material.dart';
import 'gradient_container.dart';
import 'question_screen.dart';

class QuizUi extends StatefulWidget {
  QuizUiState createState() => QuizUiState();
}

List<String> SelectedAnswer = []; //for storing all answers that user press.

class QuizUiState extends State<QuizUi> {
  void chooseAnswer(String answer) {
    SelectedAnswer.add(answer);
  }

  void QuestionScreenNavigation() {
    //this is use in on pressed in button
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionScreen(
            onSelectedAnswer: chooseAnswer,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Flutter Quiz",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 1,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.5, color: Colors.white38, style: BorderStyle.solid)),
      ),
      backgroundColor: Colors.deepPurple,
      body: Stack(
        //stack data structure
        children: [
          Gradient_Container(
            Colors.purple,
            Colors.deepPurple.shade900, //bg colors
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 300,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  color: Colors.white70,
                ),
                SizedBox(height: 35),
                Text(
                  "Learn Flutter The Fun Way!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                OutlinedButton.icon(
                    onPressed: QuestionScreenNavigation,
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        elevation: 2,
                        padding: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        side: BorderSide(
                            color: Colors.white,
                            width: 0.5,
                            style: BorderStyle.solid)),
                    icon: Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    label: Text("Start Quiz")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
