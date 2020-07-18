import 'package:flutter/material.dart';
import 'package:leafy_demo/src/widget/card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './../unfinished.dart';
import './../data/sample.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './../widget/column_builder.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}


class _EventScreenState extends State<EventScreen> {
  final double pad = 20.0;

  final List<Widget> _highlightCards = <Widget>[
    StreamBuilder(
      stream: Firestore.instance.collection('event').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return HighlightCard(
            document: snapshot.data.documents[1],
            height: 200.0,
            width: 350,
            shadow: true,
            type: 'Event',
          );
        }
      },
    ),
    StreamBuilder(
      stream: Firestore.instance.collection('event').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return HighlightCard(
            document: snapshot.data.documents[0],
            height: 200.0,
            width: 350,
            shadow: true,
            type: 'Event',
          );
        }
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(pad, 30, pad, 5),
                  child: Text(
                    'Dành cho bạn',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(pad, 30, pad + 10, 5),
                  child: InkWell(
                    child: Icon(
                      Entypo.dots_three_horizontal,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                      SizedBox(width: 8),
                    ] +
                    _highlightCards +
                    <Widget>[
                      SizedBox(width: 8),
                    ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 30, pad, 5),
              child: Text(
                'Sắp diễn ra',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StreamBuilder(
              stream: Firestore.instance.collection('event').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else {
                  return ColumnBuilderReversed(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) => InfoCard(
                      document: snapshot.data.documents[index],
                      height: 300.0,
                      shadow: true,
                      type: 'Event',
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
