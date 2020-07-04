import 'package:flutter/material.dart';
import 'package:leafy_demo/src/unfinished.dart';
import './../data/sample.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Extra extends StatelessWidget {
  double pad = 20;
  String avatarImage;

  Widget avatarDisplay() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(0, 50, 0, 25),
          child: Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(
                image: AssetImage('assets/icons/avatar.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100)),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            '$username',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              avatarDisplay(),
              SizedBox(height: 50.0),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.black45)),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(pad + 10, 15, pad + 10, 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Icon(
                          MaterialCommunityIcons.checkbox_intermediate,
                          size: 35,
                          color: Colors.green[600],
                        ),
                      ),
                      Container(
                        child: Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
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
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.black45)),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(pad + 10, 15, pad + 10, 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Icon(
                          MaterialCommunityIcons.checkbox_intermediate,
                          size: 35,
                          color: Colors.green[600],
                        ),
                      ),
                      Container(
                        child: Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
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
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.black45)),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(pad + 10, 15, pad + 10, 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Icon(
                          MaterialCommunityIcons.checkbox_intermediate,
                          size: 35,
                          color: Colors.green[600],
                        ),
                      ),
                      Container(
                        child: Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
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
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.black45)),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(pad + 10, 15, pad + 10, 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Icon(
                          MaterialCommunityIcons.checkbox_intermediate,
                          size: 35,
                          color: Colors.green[600],
                        ),
                      ),
                      Container(
                        child: Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
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
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
