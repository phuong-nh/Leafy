import 'package:flutter/material.dart';
import 'dailyQuizElements.dart';
import 'dailyQuizData.dart';

class DailyQuizInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    quizDatabaseGenerator();
    return QuizLoaderPage(quizData: getSingleRandomQuizData(),);
  }
}
