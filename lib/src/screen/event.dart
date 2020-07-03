import 'package:flutter/material.dart';
import 'package:leafy_demo/src/widget/card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './../unfinished.dart';
import './../data/sample.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final double pad = 20.0;

  final List<Widget> _highlightCards = <Widget>[
    ImageCard(
      title: 'Lorem Ipsum',
      height: 200.0,
      width: 350.0,
      margin: EdgeInsets.all(8.0),
      radius: 15.0,
      tagColor: Colors.orange,
      primaryColor: Colors.green,
      accentColor: Colors.yellow,
      textColor: Colors.white,
      type: 'Event',
      //image: 'none',
      //tag: 'HELP',
      //agency: 'HP',
    ),
    ImageCard(
      title: 'Lorem Ipsum',
      height: 200.0,
      width: 350.0,
      margin: EdgeInsets.all(8.0),
      radius: 15.0,
      tagColor: Colors.orange,
      primaryColor: Colors.green,
      accentColor: Colors.yellow,
      textColor: Colors.white,
      type: 'Event',
      //image: 'none',
      //tag: 'HELP',
      //agency: 'HP',
    ),
  ];

  final List<Widget> _eventCards = <Widget>[
    InfoCard(
      title: 'Lorem Ipsum',
      tag: 'ORANGE',
      height: 270.0,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      radius: 15.0,
      tagColor: Colors.orange,
      primaryColor: Colors.green,
      accentColor: Colors.white,
      textColor: Colors.black,
      shadow: true,
      type: 'Event',
      //image: 'none',
      //tag: 'HELP',
      //agency: 'HP',
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
              ] +
              _eventCards,
        ),
      ),
    );
  }
}
