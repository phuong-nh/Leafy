import 'package:flutter/material.dart';
import 'package:leafy_demo/src/home/screen.dart';
import 'package:leafy_demo/src/unfinished.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leafy',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.green,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  final TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //static HomeScreen test;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Unfinished(),
    Unfinished(),
    Unfinished(),
  ];

  Widget _navigationBarItem(int _index, IconData _icon) {
    Color _itemColor =
        _selectedIndex == _index - 1 ? Colors.green[600] : Colors.black87;
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: IconButton(
          icon: Icon(
            _icon,
            color: _itemColor,
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = _index - 1;
            });
            print("[Bottom Navigation Bar] Tab $_index pressed");
          },
          iconSize: 30.0,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              SizedBox(width: 5.0),
              _navigationBarItem(1, Icons.home),
              _navigationBarItem(2, Icons.calendar_view_day),
              _navigationBarItem(3, Icons.indeterminate_check_box),
              _navigationBarItem(4, Icons.person),
              SizedBox(width: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
