import 'package:flutter/material.dart';
import 'dailyQuizData.dart';

class QuizLoaderPage extends StatefulWidget {
  QuizLoaderPage({
    this.quizData,
    this.quizAnswered,
  });
  final QuizData quizData;
  final bool quizAnswered;
  @override
  _QuizLoaderPageState createState() =>
      _QuizLoaderPageState(quizData: quizData, quizAnswered: quizAnswered);
}

class _QuizLoaderPageState extends State<QuizLoaderPage> {
  _QuizLoaderPageState({
    this.quizData,
    this.quizAnswered,
  });
  QuizData quizData;
  bool quizAnswered;
  List<String> quizAnswerCardState = new List();
  List<QuizAnswerData> quizAnswerList = new List();
  @override
  Widget build(BuildContext context) {
    if (!quizAnswered) {
      quizAnswerList = quizData.quizAnswers;
      for (int _i = 0; _i < quizData.getQuizAnswerCount(); _i++) {
        quizAnswerCardState.add('');
        quizAnswerCardState[_i] = 'Unanswered';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily quiz'),
        elevation: getQuizPagePadding(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(getQuizPagePadding()),
        child: Column(
          children: <Widget>[
            Text(
              quizData.quizQuestion,
              style: Theme.of(context).textTheme.headline4,
            ),
            NotificationListener<QuizAnsweredNotification>(
              child: Expanded(
                child: ListView.builder(
                  itemCount: quizData.getQuizAnswerCount(),
                  itemBuilder: (BuildContext context, int _index) =>
                      quizAnswerList[_index]
                          .getAnswerCard(quizAnswerCardState[_index], context),
                ),
              ),
              onNotification: (notification) {
                if (!quizAnswered) {
                  quizAnswered = true;
                  for (int _i = 0; _i < quizData.getQuizAnswerCount(); _i++) {
                    quizAnswerCardState[_i] = (notification.selectedAnswer ==
                            quizAnswerList[_i].getQuizAnswerID())
                        ? 'Selected'
                        : 'Unselected';
                  }
                  setState(() {});
                }
                return true;
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                if (quizAnswered) {
                  return Text(
                    quizData.getQuizAdditionalInformation(),
                    style: Theme.of(context).textTheme.headline5,
                  );
                }
                return Container();
              },
            ),
            FlatButton(
              child: Text('Back'),
              onPressed: () {
                quizAnswered = false;
                quizAnswerCardState.clear();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
