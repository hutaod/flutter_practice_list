import 'package:flutter/material.dart';

class ExpandColosedDemo extends StatelessWidget {
  final Widget child;

  ExpandColosedDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('展开闭合案例')),
      body: Center(
        child: ExpansionTile(
          title: Text('ExpansionTile'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white24,
          children: <Widget>[
            ListTile(
              title: Text('list tile'),
              subtitle: Text('subtitle'),
            )
          ],
          initiallyExpanded: true,
        ),
      ),
    );
  }
}