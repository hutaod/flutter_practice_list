import 'package:flutter/material.dart';

class BottomIrregularNavWidget extends StatefulWidget {
  _BottomIrregularNavWidgetState createState() => _BottomIrregularNavWidgetState();
}

class _BottomIrregularNavWidgetState extends State<BottomIrregularNavWidget> {
  List<Widget> _eachView;
  int _currentIndex = 0;
  // var _bottomNavColor = Colors.lightBlue;

  void initState() { 
    super.initState();
    _eachView = List();
    _eachView..add(EachView('Home'))..add(EachView('Mine'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return EachView('NewPage');
          }));
        },
        tooltip: 'Hello ht',
        child: Icon(Icons.add,color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _currentIndex = 0; 
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _currentIndex = 1; 
                });
              },
            )
          ],
        ),
      ),
    );
  }
}


class EachView extends StatefulWidget {
  final String _title;
  EachView(this._title);

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title)),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}