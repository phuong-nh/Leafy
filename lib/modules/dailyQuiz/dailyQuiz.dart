import 'package:flutter/material.dart';
import 'dailyQuizElements.dart';
import 'dailyQuizData.dart';

class DailyQuizInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    quizDatabaseGenerator();
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(getQuizPagePadding()),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Do a quiz', style: Theme.of(context).textTheme.headline4,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizLoaderPage(quizData: getSingleRandomQuizData(), quizAnswered: false,)),
                );
              },
              elevation: 8,
            ),
          ],
        ),
      ),
    );
    //return QuizLoaderPage(quizData: getSingleRandomQuizData(),);
  }
}
