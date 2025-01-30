import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.SummaryData, {super.key});
//this constructor call in result screen and then inside we put
  // our method getSummaryData() in which we handle our all data by using map.
  //So here we just display our data by using getSummaryData()
  //function that define in result screen.
  final List<Map<String, Object>> SummaryData;
//in this list we store all summary of our question/answers
  //etc then this List we passed towards our getSummaryData()function
  //that in result screen whenever this class constructor calls in
  //result screen so this all summary data display in result
  //screen.
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        // Center the whole widget
        child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center align text
              children: SummaryData.map(
                (data) {
                  //by using map we access list in
                  //column where only store widgets list.
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8), // Add spacing
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //display data using map key
                          '${((data["question_index"]) as int) + 1}. ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.tertiarySystemBackground),
                        ),
                        SizedBox(width: 10), // Space between index and text
                        Expanded(
                          // Ensure text fits properly
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data["questions"] as String,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.white)),
                              SizedBox(height: 6),
                              Text(
                                  "Correct: ${data["correct_answers"] as String}",
                                  style: TextStyle(
                                      color: CupertinoColors.activeGreen)),
                              Text(
                                  "Your Answer: ${data["user_answer"] as String}",
                                  style: TextStyle(
                                      color: CupertinoColors.systemRed)),
                              SizedBox(height: 15),
                              Divider(
                                height: 2,
                                color: Colors.white38,
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
