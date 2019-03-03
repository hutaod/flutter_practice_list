import 'package:flutter/material.dart';

class SplashScreenAnimation extends StatefulWidget {
  _SplashScreenAnimationState createState() => _SplashScreenAnimationState();
}

class _SplashScreenAnimationState extends State<SplashScreenAnimation> with SingleTickerProviderStateMixin {

  AnimationController _container;
  Animation _animation;

  void initState() { 
    super.initState();
    _container = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_container);
    _animation.addStatusListener((status){
      if( status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SSAMyHomePage()),
          (route) => route == null
        );
      }
    });

    _container.forward(); //播放动画
  }

  @override
  void dispose() {
    _container.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class SSAMyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: Center(
        child: Text("我是首页"),
      ),
    );
  }
}