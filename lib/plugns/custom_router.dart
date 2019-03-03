import 'package:flutter/material.dart';

// 左右滑动的路由动画效果
class SwipeLeftAndRightEffectRoute extends PageRouteBuilder {
  final Widget widget;

  SwipeLeftAndRightEffectRoute(this.widget)
    :super(
      transitionDuration:Duration(milliseconds:500),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
      ){
        return widget;
      },
      transitionsBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child
      ){
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1.0, 0.0),
            end: Offset(0.0, 0.0)
          ).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.easeInOut
          )),
          child: child,
        );
      }
    );
}

// 旋转缩放的路由动画效果
class ScaleEffectRoute extends PageRouteBuilder {
  final Widget widget;

  ScaleEffectRoute(this.widget)
    :super(
      transitionDuration:Duration(seconds: 1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
      ){
        return widget;
      },
      transitionsBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child
      ){
        // // 缩放动画效果
        // return ScaleTransition(
        //   scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //     parent: animation1,
        //     curve: Curves.fastOutSlowIn
        //   )),
        //   child: child,
        // );

        // 旋转+缩放动画效果
        return RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
            )),
            child: child,
          ),
        );
      }
    );
}

// 渐隐渐现的路由动画效果
class EaseInOutRoute extends PageRouteBuilder {
  final Widget widget;

  EaseInOutRoute(this.widget)
    :super(
      transitionDuration:Duration(seconds: 1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
      ){
        return widget;
      },
      transitionsBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child
      ){
        return FadeTransition(
          opacity: Tween(
            begin: 0.0, end: 1.0
          ).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
      }
    );
}