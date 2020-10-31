import 'package:flutter/foundation.dart';

class Question {
  final int id;
  final String question;
  final String correctAnswer;
  final List<Answer> answers;

  Question({
    @required this.id,
    @required this.question,
    @required this.correctAnswer,
    @required this.answers,
  });
}

class Answer {
  final String answer;
  bool isSelected;
  Answer({
    @required this.answer,
    this.isSelected = false,
  });
}
