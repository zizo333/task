import 'package:flutter/foundation.dart';
import 'package:task/task/data/question_data.dart';
import 'package:task/task/models/question.dart';

class QuestionProvider extends ChangeNotifier {
  int _correctAnswerCount = 0;

  List<Question> get questions => QuestionsData().questions;

  int get correctAnswerCount => _correctAnswerCount;

  int get questionsLength => questions.length;

  checkCorrectAnswer({@required int questionId, @required answerStr}) {
    final currentQuestion = questions.firstWhere((q) => q.id == questionId);
    if (currentQuestion.correctAnswer == answerStr.answer) {
      _correctAnswerCount++;
    }
    questions.remove(currentQuestion);
    notifyListeners();
  }

  clearSelectedAnswers({@required Answer answer}) {
    questions.forEach((q) {
      q.answers.forEach((a) {
        a.isSelected = false;
      });
    });
  }
}
