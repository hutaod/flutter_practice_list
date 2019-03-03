import 'package:flutter/material.dart';

class BezierCurveCutting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: SimpleBottomClipper(),
            child: Container(
              color: Colors.tealAccent,
              height: 200.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: ClipPath(
              clipper: WaveBottomClipper(),
              child: Container(
                color: Colors.tealAccent,
                height: 200.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SimpleBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-30);
    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint = Offset(size.width, size.height-30);
    // 简单的贝塞尔曲线
    path.quadraticBezierTo(
      firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy
    );
    path.lineTo(size.width, size.height-30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}


class WaveBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-30);

    path.quadraticBezierTo(
      size.width/4,size.height, 
      size.width/2,size.height-30
    );
    path.quadraticBezierTo(
      size.width/4*3,size.height-80, 
      size.width,size.height-60
    );

    path.lineTo(size.width, size.height-60);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}