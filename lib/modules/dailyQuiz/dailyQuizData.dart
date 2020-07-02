import 'package:flutter/material.dart';

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
  bool quizAnswerCorrectness;
  int quizAnswerID;
  Color _answerCardBackgroundColor = Colors.white;
  Color _answerCardFilterBlendColor = Colors.transparent;
  Widget getAnswerCard(String cardMode, BuildContext context) {
    if ((cardMode != 'Unanswered') && (!quizAnswerCorrectness)) {
      _answerCardFilterBlendColor = Colors.grey;
    }
    if (cardMode == 'Selected') {
      _answerCardBackgroundColor = quizAnswerCorrectness ? Colors.green : Colors.red;
    }
    if ((cardMode != 'Unanswered') && (quizAnswerCorrectness)) {
      _answerCardBackgroundColor = Colors.green;
    }
    return Card(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(_answerCardFilterBlendColor, BlendMode.color),
        child: ListTile(
          title: Text(quizAnswer, style: Theme.of(context).textTheme.headline5,),
          onTap: () => QuizAnsweredNotification(selectedAnswer: quizAnswerID)..dispatch(context),
        ),
      ),
      color: _answerCardBackgroundColor,
      elevation: 8,
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
    _temp.shuffle();
    return _temp;
  }
  int getQuizAnswerCount() {
    return quizAnswers.length;
  }
}

List<QuizData> _quizDatabase = new List();

void quizDatabaseGenerator() {
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
}

QuizData getSingleRandomQuizData() {
  return _quizDatabase[0];
}