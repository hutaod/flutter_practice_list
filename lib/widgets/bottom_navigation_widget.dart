import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Widget child;

  BottomNavigationWidget({Key key, this.child}) : super(key: key);

  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.lightBlue;
  int _currentIndex = 0;
  List<Widget> screens = List();

  @override
  void initState() {
    screens
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text('Home',style: TextStyle(color: _BottomNavigationColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavigationColor,
            ),
            title: Text('Email',style: TextStyle(color: _BottomNavigationColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavigationColor,
            ),
            title: Text('Pages',style: TextStyle(color: _BottomNavigationColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavigationColor,
            ),
            title: Text('Airplay',style: TextStyle(color: _BottomNavigationColor))
          )
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index; 
          });
        },
      ),
    );
  }
}

/**
 * 页面
 */

class AirplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Airplay')),
      body: Center(
        child: Text('Airplay'),
      ),
    );
  }
}

class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email')),
      body: Center(
        child: Text('Email'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}

class PagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pages')),
      body: Center(
        child: Text('Pages'),
      ),
    );
  }
}