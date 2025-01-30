
class QuizQuestion {
  QuizQuestion(this.text, this.answers, this.imagePath);

  final String text;
  final List<String> answers;
  final String imagePath;

  List<String> getShuffledAnswers() {
    final ShuffledList = List.of(answers);
    ShuffledList.shuffle();
    return ShuffledList;
  }
}
//Blue Print of question