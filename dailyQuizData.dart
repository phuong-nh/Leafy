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
      _answerCardBackgroundColor = quizAnswerCorrectness ? Colors.green : Colors.red;
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
    quizQuestion: 'Lượng rác thải nhựa mà một người Việt Nam tiêu thụ trong một năm trung bỉnh là bao nhiêu?',
    quizAdditionalInformation: 'theo thống kê của Hiệp hội nhựa Việt Nam thì trong khoảng thời gian 1990 – 2015 số lượng tiêu thụ nhựa ở Việt Nam đã tăng lên chóng mặt, từ 3,8 kg/người/năm lên đến 41 kg/người/năm.',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: '37 kg/người/năm',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '39 kg/người/năm',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '41 kg/người/năm',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '43 kg/người/năm',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
    ],
  ));
  _indexer = 0;
  _quizDatabase.add(QuizData(
    quizQuestion: 'Trong một năm, thế giới tiêu thụ bao nhiêu túi nilon?',
    quizAdditionalInformation: 'Quá kinh hoàng',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: '3000 tỉ',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '4000 tỉ',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '5000 tỉ',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
    ],
  ));
  _indexer = 0;
  _quizDatabase.add(QuizData(
    quizQuestion: '"Học sinh phải trồng 10 cây xanh nếu muốn tốt nghiệp" là quy định của nước nào?',
    quizAdditionalInformation: 'Politically abused',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: 'Hungary',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Philippines',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Indonesia',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Thụy Điển',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Canada',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
    ],
  ));
  _indexer = 0;
  _quizDatabase.add(QuizData(
    quizQuestion: 'Ai là người đã khởi xướng phong trào trồng 10 triệu cây xanh trên Youtube?',
    quizAdditionalInformation: 'Politically abused',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: 'MrBeast',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Logan Paul',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'NTN Vlogs',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: 'Pewdiepie',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
    ],
  ));
  _indexer = 0;
  _quizDatabase.add(QuizData(
    quizQuestion: 'Tái chế 1 tấn giấy sẽ cứu được bao nhiêu cây gỗ trưởng thành?',
    quizAdditionalInformation: 'Politically abused',
    quizAnswers: <QuizAnswerData>[
      QuizAnswerData(
        quizAnswer: '15',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '17',
        quizAnswerCorrectness: true,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '19',
        quizAnswerCorrectness: false,
        quizAnswerID: ++_indexer,
      ),
      QuizAnswerData(
        quizAnswer: '21',
        quizAnswerCorrectness: false,
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