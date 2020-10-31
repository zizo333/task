import 'package:task/task/models/question.dart';

class QuestionsData {
  static final List<Answer> _answers1 = [
    Answer(answer: 'Report'),
    Answer(answer: 'Field'),
    Answer(answer: 'Record'),
    Answer(answer: 'File'),
  ];
  static final List<Answer> _answers2 = [
    Answer(answer: 'Database'),
    Answer(answer: 'Double Byte'),
    Answer(answer: 'Data Block'),
    Answer(answer: 'Driver Boot'),
  ];
  static final List<Answer> _answers3 = [
    Answer(answer: 'Digital Transmission Protocol'),
    Answer(answer: 'DeskTop Publishing'),
    Answer(answer: 'Data Type Programming'),
    Answer(answer: 'Document Type Processing'),
  ];
  static final List<Answer> _answers4 = [
    Answer(answer: 'Field'),
    Answer(answer: 'Factor'),
    Answer(answer: 'Flash'),
    Answer(answer: 'Force'),
  ];
  static final List<Answer> _answers5 = [
    Answer(answer: 'Angelo marconi'),
    Answer(answer: 'Anno median'),
    Answer(answer: 'Amplitude modulation'),
    Answer(answer: 'Amperes'),
  ];

  List<Question> _questions = [
    Question(
      id: 1,
      question: 'What is part of a database that holds only one type of information?',
      answers: _answers1,
      correctAnswer: 'Field',
    ),
    Question(
      id: 2,
      question: '"DB" computer abbreviation usually means ?',
      answers: _answers2,
      correctAnswer: 'Database',
    ),
    Question(
      id: 3,
      question: '"DTP" computer abbreviation usually means ?',
      answers: _answers3,
      correctAnswer: 'DeskTop Publishing',
    ),
    Question(
      id: 4,
      question: 'Voltage is sometimes referred to as EMF, or Electromotive...?',
      answers: _answers4,
      correctAnswer: 'Force',
    ),
    Question(
      id: 5,
      question: 'What does AM mean?',
      answers: _answers5,
      correctAnswer: 'Amplitude modulation',
    ),
  ];

  List<Question> get questions => _questions;
}
