import 'package:flutter/material.dart';
import 'package:leafy_demo/src/widget/card.dart';
import './../unfinished.dart';
import './../data/sample.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double pad = 20.0;

  Widget welcome() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(pad, 15, pad, 0),
                child: Text(
                  'Xin chào,',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(pad, 3, pad, 0),
                child: Text(
                  '$username',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, pad, 0),
            alignment: Alignment.centerLeft,
            child: InkWell(
              child: Container(
                height: 55.0,
                width: 55.0,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/avatar.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Unfinished()),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  final List<Widget> _highlightCards = <Widget>[
    ImageCard(
      title: 'Lorem Ipsum',
      height: 200.0,
      width: 350.0,
      margin: EdgeInsets.all(7.0),
      radius: 15.0,
      tagColor: Colors.orange,
      primaryColor: Colors.green,
      accentColor: Colors.yellow,
      textColor: Colors.white,
      //image: 'none',
      //tag: 'HELP',
      //agency: 'HP',
    ),
    ImageCard(
      title: 'Lorem Ipsum',
      height: 200.0,
      width: 350.0,
      margin: EdgeInsets.all(7.0),
      radius: 15.0,
      tagColor: Colors.orange,
      primaryColor: Colors.green,
      accentColor: Colors.yellow,
      textColor: Colors.white,
      //image: 'none',
      //tag: 'HELP',
      //agency: 'HP',
    ),
  ];

  final List<Widget> _newsCards = <Widget>[
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
      //image: 'none',
      //tag: 'HELP',
      //agency: 'HP',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
              SizedBox(height: 35.0),
              welcome(),
              SizedBox(height: 15.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                        SizedBox(width: 10),
                      ] +
                      _highlightCards +
                      <Widget>[
                        SizedBox(width: 10),
                      ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(pad, 20, pad, 10),
                child: Text(
                  'Công cụ',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    ImageCard(
                      title: 'Tool',
                      height: 130.0,
                      width: 110.0,
                      margin: EdgeInsets.all(7.0),
                      radius: 15.0,
                      tagColor: Colors.orange,
                      primaryColor: Colors.green,
                      accentColor: Colors.yellow,
                      textColor: Colors.white,
                    ),
                    ImageCard(
                      title: 'Tool',
                      height: 130.0,
                      width: 110.0,
                      margin: EdgeInsets.all(7.0),
                      radius: 15.0,
                      tagColor: Colors.orange,
                      primaryColor: Colors.green,
                      accentColor: Colors.yellow,
                      textColor: Colors.white,
                    ),
                    ImageCard(
                      title: 'Tool',
                      height: 130.0,
                      width: 110.0,
                      margin: EdgeInsets.all(7.0),
                      radius: 15.0,
                      tagColor: Colors.orange,
                      primaryColor: Colors.green,
                      accentColor: Colors.yellow,
                      textColor: Colors.white,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(pad, 20, pad, 5),
                child: Text(
                  'Thông tin',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ] +
            _newsCards +
            [
              SizedBox(height: 35.0),
            ],
      ),
    );
  }
}
