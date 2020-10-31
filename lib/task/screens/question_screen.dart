import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/task/models/question.dart';
import 'package:task/task/view_models/questions_provider.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({Key key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  PageController _pageController;
  int _currentIndex = 0;
  Answer _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Question Task',
        ),
      ),
      body: Center(
        child: ChangeNotifierProvider<QuestionProvider>(
          create: (context) => QuestionProvider(),
          child: Consumer<QuestionProvider>(
            builder: (context, q, _) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${q.correctAnswerCount} / ${q.questionsLength}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Card(
                        child: PageView.builder(
                            controller: _pageController,
                            itemCount: q.questionsLength,
                            itemBuilder: (_, i) {
                              return _buildQuestionForm(q.questions[i]);
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    RaisedButton(
                      onPressed: _selectedAnswer == null || _currentIndex == 5
                          ? () {}
                          : () {
                              q.checkCorrectAnswer(
                                answerStr: _selectedAnswer,
                                questionId: q.questions[_currentIndex].id,
                              );
                              _selectedAnswer = null;
                              _pageController.animateToPage(
                                ++_currentIndex,
                                duration: Duration(microseconds: 250),
                                curve: Curves.easeIn,
                              );
                            },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text(_currentIndex == 5 ? 'finish' : 'submit'),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionForm(Question questionData) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: _currentIndex == 5
          ? Center(
              child: Consumer<QuestionProvider>(
                builder: (context, q, _) {
                  return Text(
                    'Result : ${q.correctAnswerCount} / ${q.questionsLength}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  questionData.question,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: questionData.answers.length,
                  itemBuilder: (_, i) => _buildAnswerForm(
                    questionData.answers[i],
                  ),
                )
              ],
            ),
    );
  }

  Widget _buildAnswerForm(Answer answerData) {
    return GestureDetector(
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: answerData.isSelected ? Colors.green : Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(answerData.answer),
        ],
      ),
      onTap: () {
        _selectedAnswer = answerData;
        setState(() {
          Provider.of<QuestionProvider>(context, listen: false)
              .clearSelectedAnswers(answer: answerData);
          answerData.isSelected = !answerData.isSelected;
        });
      },
    );
  }
}
