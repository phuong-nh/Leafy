import 'package:flutter/material.dart';
import 'dart:math';

double _quizPagePadding = 20;

double getQuizPagePadding() {
  return _quizPagePadding;
}

class QuizAnsweredNotification extends Notification {
  QuizAnsweredNotification({
    this.selectedAnswer,
  });
  final int selectedAnswer;
}

class QuizAnswerData {
  QuizAnswerData({
    this.quizAnswer,
    this.quizAnswerCorrectness,
    this.quizAnswerID,
  });
  String quizAnswer;
  bool quizAnswerCorrectness = false;
  int quizAnswerID;
  Color _answerCardBackgroundColor = Colors.white;
  Color _answerCardFilterBlendColor = Colors.transparent;
  Widget getAnswerCard(String cardMode, BuildContext context) {
    if ((cardMode != 'Unanswered') && (!quizAnswerCorrectness)) {
      _answerCardFilterBlendColor = Colors.transparent;
    }
    if (cardMode == 'Selected') {
      _answerCardBackgroundColor =
          quizAnswerCorrectness ? Colors.green : Colors.red;
    }
    if ((cardMode != 'Unanswered') && (quizAnswerCorrectness)) {
      _answerCardBackgroundColor = Colors.green;
    }
    if (cardMode == 'Unanswered') {
      _answerCardBackgroundColor = Colors.white;
      _answerCardFilterBlendColor = Colors.transparent;
    }
    return Card(
      child: ColorFiltered(
        colorFilter:
            ColorFilter.mode(_answerCardFilterBlendColor, BlendMode.color),
        child: ListTile(
          title: Text(
            quizAnswer,
            style: Theme.of(context).textTheme.headline5,
          ),
          onTap: () => QuizAnsweredNotification(selectedAnswer: quizAnswerID)
            ..dispatch(context),
        ),
      ),
      color: _answerCardBackgroundColor,
      elevation: 8,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  int getQuizAnswerID() {
    return quizAnswerID;
  }
}

class QuizData {
  QuizData({
    this.quizQuestion,
    this.quizAdditionalInformation,
    this.quizAnswers,
  });
  String quizQuestion;
  String quizAdditionalInformation;
  List<QuizAnswerData> quizAnswers;
  String getQuizQuestion() {
    return quizQuestion;
  }

  String getQuizAdditionalInformation() {
    return quizAdditionalInformation;
  }

  List<QuizAnswerData> getQuizAnswers() {
    List<QuizAnswerData> _temp = quizAnswers;
    _temp..shuffle();
    return _temp;
  }

  int getQuizAnswerCount() {
    return quizAnswers.length;
  }
}

List<QuizData> _quizDatabase = new List();

void quizDatabaseGenerator() {
  _quizDatabase.clear();
  int _indexer = 0;
  _quizDatabase.add(QuizData(
    quizQuestion: 'COVID-?',
    quizAdditionalInformation: 'It\'s not the Chinese virus',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: '17',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '18',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '19',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '20',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
    ],
  ));
  _indexer = 0;
  _quizDatabase.add(QuizData(
    quizQuestion: 'Cover your mouth with?',
    quizAdditionalInformation: 'Shut up Karen',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: 'Clothes',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Underwear',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Mask',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
    ],
  ));
  _indexer = 0;
  _quizDatabase.add(QuizData(
    quizQuestion: 'Greta Thunberg helped improve the environment',
    quizAdditionalInformation: 'Politically abused',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: 'True',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'False',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
    ],
  ));
  _indexer = 0;
}

QuizData getSingleRandomQuizData() {
  return _quizDatabase[Random().nextInt(_quizDatabase.length)];
  //return _quizDatabase[1];
}
