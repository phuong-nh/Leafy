import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './page.dart';
import '../unfinished.dart';

class HighlightCard extends StatelessWidget {
  DocumentSnapshot document;
  String type;
  Color tagColor = Colors.orange,
      primaryColor = Colors.green,
      accentColor = Colors.black;
  EdgeInsets margin = EdgeInsets.all(7.0);
  double height, radius = 15, width;
  bool shadow;

  HighlightCard(
      {this.document, this.type, this.height, this.shadow, this.width});

  Widget imageDisplay() {
    if (document['image'] != '')
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(document['image']),
            fit: BoxFit.cover,
          ),
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
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
    else
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        child: imageDisplay(),
        onTap: () {
          Navigator.of(context).push(_createRoute(type, document));
        },
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  DocumentSnapshot document;
  String type;
  Color tagColor = Colors.orange,
      primaryColor = Colors.green,
      accentColor = Colors.black;
  EdgeInsets margin = EdgeInsets.all(7.0);
  double height, radius = 15, width;
  bool shadow;

  ImageCard({this.document, this.type, this.height, this.shadow, this.width});

  Widget tagDisplay() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      height: 22.0,
      child: Text(
        document['tag'],
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13)),
      ),
    );
  }

  Widget timeDisplay() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        "${document['time']}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget agencyDisplay() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        document['agency'],
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget imageDisplay() {
    if (document['image'] != '')
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(document['image']),
            fit: BoxFit.cover,
          ),
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
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
    else
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        child: Stack(
          children: <Widget>[
            imageDisplay(),
            Container(
              alignment: Alignment.bottomLeft,
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, accentColor],
                ),
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
                boxShadow: [
                  if (shadow == true)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                mainAxisAlignment: ((document['tag'] != '')
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (document['tag'] != '') tagDisplay(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (document['title'] != '')
                        Text(
                          document['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (document['agency'] != '') agencyDisplay(),
                      if (document['time'] != '') timeDisplay(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(_createRoute(type, document));
        },
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  DocumentSnapshot document;
  String type;
  Color tagColor = Colors.orange,
      primaryColor = Colors.green,
      accentColor = Colors.white;
  EdgeInsets margin = EdgeInsets.fromLTRB(20, 7, 20, 7);
  double height, radius = 15, width;
  bool shadow;

  InfoCard({this.document, this.type, this.height, this.shadow, this.width});

  Widget tagDisplay() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      height: 22.0,
      child: Text(
        document['tag'],
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13)),
      ),
    );
  }

  Widget timeDisplay() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        "${document['time']}",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget agencyDisplay() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        document['agency'],
        style: TextStyle(
          color: Colors.black87,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget imageDisplay() {
    if (document['image'] != '')
      return Container(
        height: height / 3 * 2,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(document['image']),
            fit: BoxFit.cover,
          ),
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
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
      );
    else
      return Container(
        height: height / 5 * 3,
        width: width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        child: Column(
          children: <Widget>[
            imageDisplay(),
            Container(
              //color: accentColor,
              alignment: Alignment.bottomLeft,
              height: height / 5 * 2,
              width: width,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
                boxShadow: [
                  if (shadow == true)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                mainAxisAlignment: ((document['tag'] != '')
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (document['tag'] != '') tagDisplay(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (document['title'] != '')
                        Text(
                          document['title'],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (document['agency'] != '') agencyDisplay(),
                      if (document['time'] != '') timeDisplay(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(_createRoute(type, document));
        },
      ),
    );
  }
}

Route _createRoute(String type, DocumentSnapshot document) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        (type == 'Event') ? EventPage(document) : NewsPage(document),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
