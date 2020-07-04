import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:leafy_demo/src/unfinished.dart';

class NewsPage extends StatefulWidget {
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
              image: AssetImage(image),
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
              (image != null) ? headRow() : noImage(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(pad, 0, pad, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "$title",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(pad, 20, pad, 30),
                child: FutureBuilder(
                    future: rootBundle.loadString("assets/fake_UI/flutter.md"),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return MarkdownBody(
                          styleSheet:
                              MarkdownStyleSheet.fromTheme(Theme.of(context))
                                  .copyWith(textScaleFactor: 1.2),
                          data: snapshot.data,
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String agencyLocation,
      title,
      venue,
      type,
      agency,
      location,
      image = 'assets/events/trash.jpg',
      description =
          'Lorem Ipsum chỉ đơn giản là một đoạn văn bản giả, được dùng vào việc trình bày và dàn trang phục vụ cho in ấn. Lorem Ipsum đã được sử dụng như một văn bản chuẩn cho ngành công nghiệp in ấn từ những năm 1500, khi một họa sĩ vô danh ghép nhiều đoạn văn bản với nhau để tạo thành một bản mẫu văn bản. Đoạn văn bản này không những đã tồn tại năm thế kỉ, mà khi được áp dụng vào tin học văn phòng, nội dung của nó vẫn không hề bị thay đổi. Nó đã được phổ biến trong những năm 1960 nhờ việc bán những bản giấy Letraset in những đoạn Lorem Ipsum, và gần đây hơn, được sử dụng trong các ứng dụng dàn trang, như Aldus PageMaker.';
  List<String> update;
  int availability;
  double price, pad = 20;
  Color primaryColor, accentColor = Colors.orange[600];
  Color liked = Colors.white;
  DateTime time;

  Widget headRow() {
    return Stack(
      children: <Widget>[
        Container(
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
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
          Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
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
                          "$agency",
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
                          "$agencyLocation",
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

  List<Widget> _updateInfo = [
    UpdateInfo('Lorem Ipsum', DateTime.now()),
    UpdateInfo('Lorem Ipsum', DateTime.now()),
    UpdateInfo('Lorem Ipsum', DateTime.now()),
    UpdateInfo('Lorem Ipsum', DateTime.now()),
    UpdateInfo('Lorem Ipsum', DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                        (image != null) ? headRow() : noImage(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(pad, 0, pad, 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "$title",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        mainInfo(MaterialCommunityIcons.calendar, '$time'),
                        mainInfo(MaterialCommunityIcons.map_marker, '$venue'),
                        mainInfo(MaterialCommunityIcons.map, '$location'),
                        mainInfo(MaterialCommunityIcons.flag, '$type'),
                        mainInfo(
                            MaterialCommunityIcons.office_building, '$agency'),
                        mainInfo(MaterialCommunityIcons.ticket_account,
                            '$availability chỗ trống'),
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
                            "$description",
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
                      ] +
                      _updateInfo +
                      [
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Unfinished()),
                  );
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
  String text;
  DateTime time;
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
