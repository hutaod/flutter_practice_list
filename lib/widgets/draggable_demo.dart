import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {

  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DraggaleWidget(
            offset: Offset(80.0, 80.0),
            color: Colors.tealAccent,
          ),
          DraggaleWidget(
            offset: Offset(180.0, 80.0),
            color: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color){
                _draggableColor = color;
              },
              builder: (context, candidaData, rejectedData){
                return Container(
                  width: 200,
                  height: 200,
                  color: _draggableColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DraggaleWidget extends StatefulWidget {
  final Offset offset;
  final Color color;

  const DraggaleWidget({Key key, this.offset, this.color}): super(key: key);

  _DraggaleWidgetState createState() => _DraggaleWidgetState();
}

class _DraggaleWidgetState extends State<DraggaleWidget> {

  Offset offset = Offset(0, 0);
  void initState() { 
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.color,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.color,
        ),
        feedback: Container(
          width: 110.0,
          height: 110.0,
          color: widget.color.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset){
          setState(() {
            this.offset = offset; 
          });
        },
      ),
    );
  }
}