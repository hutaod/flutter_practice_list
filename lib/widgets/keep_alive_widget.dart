import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() { 
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保持页面状态'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          KeepAliveWidgetHomePage(),
          KeepAliveWidgetHomePage(),
          KeepAliveWidgetHomePage(),
        ],
      ),
    );
  }
}

class KeepAliveWidgetHomePage extends StatefulWidget {
  final Widget child;

  KeepAliveWidgetHomePage({Key key, this.child}) : super(key: key);

  _KeepAliveWidgetHomePageState createState() => _KeepAliveWidgetHomePageState();
}

class _KeepAliveWidgetHomePageState extends State<KeepAliveWidgetHomePage> with AutomaticKeepAliveClientMixin {
  
  int _counter = 0;

  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() { _counter++; });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一次加1'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}