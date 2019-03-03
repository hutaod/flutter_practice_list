import 'package:flutter/material.dart';
import '../plugns/custom_router.dart';

class RouteSwitchEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('路由动画效果')),
      body: Card(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('左右滑动的路由动画效果'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RouteSwitchEffectFirstPage(SwipeLeftAndRightEffectRoute(RouteSwitchEffectSecondPage()))
                  ));
                },
              ),
              Divider(),
              ListTile(
                title: Text('旋转缩放的路由动画效果'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RouteSwitchEffectFirstPage(ScaleEffectRoute(RouteSwitchEffectSecondPage()))
                  ));
                },
              ),
              Divider(),
              ListTile(
                title: Text('渐隐渐现的路由动画效果'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RouteSwitchEffectFirstPage(EaseInOutRoute(RouteSwitchEffectSecondPage()))
                  ));
                },
              ),
              Divider(),
            ],
          )
      )
    );
  }
}

// RouteSwitchEffectFirstPage()
class RouteSwitchEffectFirstPage extends StatelessWidget {
  final Object router;
  // final int effectIndex;
  RouteSwitchEffectFirstPage(this.router);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('FirstPage',style: TextStyle(fontSize: 36.0)),
        elevation: 0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: (){
            Navigator.of(context).push(router);
          },
        ),
      ),
    );
  }
}

class RouteSwitchEffectSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage',style: TextStyle(fontSize: 36.0)),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}