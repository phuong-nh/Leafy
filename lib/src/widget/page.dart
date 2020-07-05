import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:leafy_demo/src/unfinished.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import './../widget/column_builder.dart';

class NewsPage extends StatefulWidget {
  DocumentSnapshot document;

  NewsPage(this.document);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  double pad = 20.0;
  String image, title = 'LoremIpsum';
  Color liked = Colors.white;

  Widget headRow() {
    return Stack(
      children: <Widget>[
        Container(
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.document['image']),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.transparent, Colors.black54],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(pad, 20, pad, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    child: Icon(
                      (liked == Colors.white)
                          ? Entypo.heart_outlined
                          : Entypo.heart,
                      color: liked,
                      size: 35,
                    ),
                    onTap: () {
                      setState(
                        () {
                          if (liked == Colors.white) {
                            liked = Colors.red[400];
                          } else {
                            liked = Colors.white;
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget noImage() {
    return Container(
      padding: EdgeInsets.fromLTRB(pad, 20, pad, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.black87,
                  size: 35.0,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              InkWell(
                child: Icon(
                  (liked == Colors.white)
                      ? Entypo.heart_outlined
                      : Entypo.heart,
                  color: (liked == Colors.white)
                      ? Colors.black87
                      : Colors.red[400],
                  size: 35,
                ),
                onTap: () {
                  setState(
                    () {
                      if (liked == Colors.white) {
                        liked = Colors.red[400];
                      } else {
                        liked = Colors.white;
                      }
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              (widget.document['image'] != '') ? headRow() : noImage(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(pad, 0, pad, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.document['title'],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Html(data: widget.document['html']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventPage extends StatefulWidget {
  DocumentSnapshot document;

  EventPage(this.document);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  double pad = 20;
  Color primaryColor, accentColor = Colors.orange[600];
  Color liked = Colors.white;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget headRow() {
    return Stack(
      children: <Widget>[
        Container(
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.document['image']),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.transparent, Colors.black54],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(pad, 20, pad, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  InkWell(
                    child: Icon(
                      (liked == Colors.white)
                          ? Entypo.heart_outlined
                          : Entypo.heart,
                      color: liked,
                      size: 35,
                    ),
                    onTap: () {
                      setState(
                        () {
                          if (liked == Colors.white) {
                            liked = Colors.red[400];
                          } else {
                            liked = Colors.white;
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget noImage() {
    return Container(
      padding: EdgeInsets.fromLTRB(pad, 20, pad, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.black87,
                  size: 35.0,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              InkWell(
                child: Icon(
                  (liked == Colors.white)
                      ? Entypo.heart_outlined
                      : Entypo.heart,
                  color: (liked == Colors.white)
                      ? Colors.black87
                      : Colors.red[400],
                  size: 35,
                ),
                onTap: () {
                  setState(
                    () {
                      if (liked == Colors.white) {
                        liked = Colors.red[400];
                      } else {
                        liked = Colors.white;
                      }
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget mainInfo(IconData icon, String text) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.centerStart,
      padding: EdgeInsets.fromLTRB(pad + 10, 10, pad, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(
              icon,
              size: 28,
              color: accentColor,
            ),
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget agencyDetails() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 15, 20, 15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Icon(
                      Icons.person,
                      size: 50.0,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          widget.document['agency'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Text(
                          widget.document['agencyLocation'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Unfinished()),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    (widget.document['image'] != '') ? headRow() : noImage(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(pad, 0, pad, 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.document['title'],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    mainInfo(MaterialCommunityIcons.calendar,
                        widget.document['time']),
                    mainInfo(MaterialCommunityIcons.map_marker,
                        widget.document['venue']),
                    mainInfo(MaterialCommunityIcons.map,
                        widget.document['location']),
                    mainInfo(
                        MaterialCommunityIcons.flag, widget.document['tag']),
                    mainInfo(MaterialCommunityIcons.office_building,
                        widget.document['agency']),
                    mainInfo(MaterialCommunityIcons.ticket_account,
                        '${widget.document['availability']} chỗ trống'),
                    Container(
                      padding: EdgeInsets.fromLTRB(pad, 15, pad, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nội dung",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(pad, 10, pad, 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.document['description'],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(pad, 15, pad, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cập nhật",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ColumnBuilder(
                      itemCount: widget.document['update'].length,
                      itemBuilder: (context, index) => UpdateInfo(
                        widget.document['update'][index]['text'],
                        widget.document['update'][index]['textTime'],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(pad, 25, pad, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tổ chức",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[Container()],
                      ),
                    ),
                    agencyDetails(),
                    SizedBox(
                      height: 100.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(pad, 0, pad, 20),
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Container(
                  child: Text(
                    "Đăng kí",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 60,
                  width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
                onTap: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text(
                      'Đã đăng kí thành công',
                    ),
                    duration: Duration(seconds: 3),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpdateInfo extends StatelessWidget {
  String text, time;
  double pad = 20;

  UpdateInfo(this.text, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.black45)),
      ),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(pad + 10, 10, pad + 10, 0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$time',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '$text',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
