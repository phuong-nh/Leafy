import 'package:flutter/material.dart';
import 'package:leafy_demo/src/unfinished.dart';

class CheckCard extends StatefulWidget {
  String title = 'ERROR';
  Color primaryColor = Colors.white;
  Color secondaryColor = Colors.black12;
  ImageProvider image;

  CheckCard({this.title});

  @override
  _CheckCardState createState() => _CheckCardState();
}

class _CheckCardState extends State<CheckCard> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: InkWell(
        child: Container(
          //padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Checkbox(
                  value: checkBoxValue,
                  activeColor: Colors.green,
                  onChanged: (bool newValue) {
                    setState(() {
                      checkBoxValue = newValue;
                    });
                    Text(widget.title);
                  },
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            (checkBoxValue == true)
                ? checkBoxValue = false
                : checkBoxValue = true;
          });
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      decoration: BoxDecoration(
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
}
