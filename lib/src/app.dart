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
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Unfinished(),
    Unfinished(),
    Unfinished(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 32.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('X'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
            title: Text('X'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.indeterminate_check_box),
            title: Text('X'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('X'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[600],
        unselectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}
