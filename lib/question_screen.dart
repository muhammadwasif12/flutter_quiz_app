import 'package:flutter/material.dart';
import 'Gradient_Container.dart';
import 'elevated_button.dart';
import 'package:my_flutter_app/Data/questions.dart';
import 'result_screen.dart';
import 'quiz_ui.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer)
      onSelectedAnswer; // Function to store selected answer

  @override
  QuestionScreenState createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0; // Stores the current question index

  void nextQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer); // Store user answer

    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++; // Move to next question
      } else {
        // Navigate to result screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              chosenAnswer: SelectedAnswer, // Pass an empty list initially
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Quiz",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 1,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.5, color: Colors.white38)),
      ),
      body: Stack(
        children: [
          Gradient_Container(Colors.purple, Colors.deepPurple.shade900),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: AssetImage(questions[questionIndex].imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      questions[questionIndex].text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ...questions[questionIndex].getShuffledAnswers().map((answer) {
                  return AnswerButton(
                      answerText: answer,
                      onTap: () {
                        nextQuestion(answer);
                      });
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
