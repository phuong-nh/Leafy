import 'package:flutter/material.dart';

class Unfinished extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              ":'(",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 128.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
          ),
          Container(
            child: Text(
              "Ở đây chưa xong,\nquay lại đi bạn",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
          ),
        ],
      ),
    );
  }
}
