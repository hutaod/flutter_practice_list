import 'package:flutter/material.dart';

class TooltipControlDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("toolTip demo")),
      body: Center(
        child: Tooltip(
          message: '这是轻提示',
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.limeAccent,
            child: Center(
              child: Text('长按我'),
            ),
          ),
        ),
      ),
    );
  }
}