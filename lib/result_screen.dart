import 'package:flutter/material.dart';
import 'package:my_flutter_app/Data/questions.dart';
import 'Gradient_Container.dart';
import 'questions_summary.dart';
import 'quiz_ui.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer; // Stores user's answers

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        "question_index": i,
        "questions": questions[i].text,
        "correct_answers": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }
    return summary;
  }

  void onRestart(BuildContext context) {
    chosenAnswer.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => QuizUi()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalCorrectAnswers = summaryData
        .where((data) => (data["correct_answers"] == data["user_answer"]))
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Quiz",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 1,
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: Colors.white38),
        ),
      ),
      body: Stack(
        children: [
          Gradient_Container(
            Colors.purple,
            Colors.deepPurple.shade900,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Result",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "You Answered $numTotalCorrectAnswers out of $numTotalQuestions Questions Correctly!",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Wrap QuestionSummary inside Expanded to allow scrolling
              Expanded(
                child: QuestionSummary(summaryData),
              ),

              const SizedBox(height: 50),
              OutlinedButton.icon(
                onPressed: () => onRestart(context), // Pass context
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: const EdgeInsets.all(12),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                ),
                icon: const Icon(
                  Icons.restart_alt_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                label: const Text("Restart Quiz"),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
