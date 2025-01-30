import 'package:flutter/cupertino.dart';
import 'package:my_flutter_app/models/quiz_question.dart';

final questions = [
  QuizQuestion(
    'Q1: What are the main building blocks of Flutter UIs?',
    ['Widgets', 'Components', 'Blocks', 'Functions'],
    'assets/images/p1.webp',
  ),
  QuizQuestion(
    'Q2: How are Flutter UIs built?',
    [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android'
    ],
    'assets/images/p9.webp',
  ),
  QuizQuestion(
    'Q3: What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data'
    ],
    'assets/images/p3.jpg',
  ),
  QuizQuestion(
    'Q4: Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above'
    ],
    'assets/images/p2.png',
  ),
  QuizQuestion(
    'Q5: What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated'
    ],
    'assets/images/p5.jpg',
  ),
  QuizQuestion(
    'Q6: How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()'
    ],
    'assets/images/p7.png',
  ),
];
