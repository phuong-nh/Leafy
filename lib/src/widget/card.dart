import 'package:flutter/material.dart';

import '../unfinished.dart';
import '../unfinished.dart';

class ImageCard extends StatelessWidget {
  String title, tag, agency, image;
  Color tagColor, primaryColor, accentColor, textColor;
  DateTime time;
  EdgeInsets margin;
  double height, radius, width;
  bool shadow;

  ImageCard({
    this.title,
    this.tag,
    this.agency,
    this.image,
    this.tagColor,
    this.primaryColor,
    this.accentColor,
    this.time,
    this.margin,
    this.radius,
    this.height,
    this.width,
    this.shadow,
    this.textColor,
  });

  Widget tagDisplay() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      height: 22.0,
      child: Text(
        "$tag",
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
        "$time",
        style: TextStyle(
          color: textColor,
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
        "$agency",
        style: TextStyle(
          color: textColor,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget imageDisplay() {
    if (image != null)
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
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
                mainAxisAlignment: ((tag != null)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (tag != null) tagDisplay(),
                  Column(
                    children: <Widget>[
                      if (title != null)
                        Text(
                          "$title",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (agency != null) agencyDisplay(),
                      if (time != null) timeDisplay(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  String title, tag, agency, image;
  Color tagColor, primaryColor, accentColor, textColor;
  DateTime time;
  EdgeInsets margin;
  double height, radius, width;
  bool shadow;

  InfoCard({
    this.title,
    this.tag,
    this.agency,
    this.image,
    this.tagColor,
    this.primaryColor,
    this.accentColor,
    this.time,
    this.margin,
    this.radius,
    this.height,
    this.width,
    this.shadow,
    this.textColor,
  });

  Widget tagDisplay() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      height: 22.0,
      child: Text(
        "$tag",
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
        "$time",
        style: TextStyle(
          color: textColor,
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
        "$agency",
        style: TextStyle(
          color: textColor,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget imageDisplay() {
    if (image != null)
      return Container(
        height: height / 3 * 2,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
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
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                mainAxisAlignment: ((tag != null)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (tag != null) tagDisplay(),
                  Column(
                    children: <Widget>[
                      if (title != null)
                        Text(
                          "$title",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (agency != null) agencyDisplay(),
                      if (time != null) timeDisplay(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Unfinished(),
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
