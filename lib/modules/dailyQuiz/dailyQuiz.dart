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
            Text('Hãy thử trả lời một câu đố', style: Theme.of(context).textTheme.headline5,),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text('Thực hiện câu đố', style: Theme.of(context).textTheme.headline4,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizLoaderPage(quizData: getSingleRandomQuizData(), quizAnswered: false,)),
                  );
                },
                elevation: 8,
              ),
            ),
          ],
        ),
      ),
    );
    //return QuizLoaderPage(quizData: getSingleRandomQuizData(),);
  }
}
