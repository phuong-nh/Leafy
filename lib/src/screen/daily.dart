import 'package:flutter/material.dart';
import './../widget/challenge.dart';

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  Widget header(String _title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Text(
        _title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget progressCheck() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
      height: 200.0,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fake_UI/progress.jpg'),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
    );
  }

  List<Widget> checklistItems = <Widget>[
    CheckCard(
      title: "Không sử dụng túi ni lông",
    ),
    CheckCard(
      title: "Nhặt 5 chai nhựa",
    ),
    CheckCard(
      title: "Mang theo bình nước",
    ),
    CheckCard(
      title: "Đi bộ quang đường ngắn",
    ),
  ];

  Widget checklist() {
    if (checklistItems.length > 0) {
      return Column(
        children: checklistItems,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Text(
                'Tiến triển',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            progressCheck(),
            SizedBox(
              height: 15.0,
            ),
            header("Mục tiêu"),
            checklist(),
          ],
        ),
      ),
    );
  }
}
