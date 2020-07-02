import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  String title, tag, agency, image;
  Color tagColor, primaryColor, accentColor;
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
        "$agency",
        style: TextStyle(
          color: Colors.white,
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
                            color: Colors.white,
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
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  String title, tag, agency, image;
  Color tagColor, primaryColor, accentColor;
  DateTime time;
  EdgeInsets margin;
  double height, radius, width;

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
  });

  Widget tagDisplay() {
    if (tag != null)
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
    if (time != null)
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
        child: Text(
          "$time",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  }

  Widget agencyDisplay() {
    if (agency != null)
      return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
        child: Text(
          "$agency",
          style: TextStyle(
            color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Container(
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
            ),
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
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  tagDisplay(),
                  Column(
                    children: <Widget>[
                      Text(
                        "$title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      agencyDisplay(),
                      timeDisplay(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
