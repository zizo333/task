import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task/screens/question_screen.dart';
import 'task/view_models/questions_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionProvider>(
      create: (context) => QuestionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuestionsScreen(),
      ),
    );
  }
}
