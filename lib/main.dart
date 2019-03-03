import 'package:flutter/material.dart';
import './widgets/bottom_navigation_widget.dart';
import './widgets/bottom_irregular_nav_widget.dart';
import './widgets/route_switch_effect.dart';
import './widgets/frosted_demo_widget.dart';
import './widgets/keep_alive_widget.dart';
import './widgets/not_simple_search_bar.dart';
import './widgets/adding_photo_widget.dart';
import './widgets/expand_closed_demo.dart';
import './widgets/expand_closed_list_demo.dart';
import './widgets/bezier_curve_cutting.dart';
// import './widgets/splash_screen_animation.dart';
import './widgets/swipe_right_to_back.dart';
import './widgets/tooltip_control_demo.dart';
import './widgets/draggable_demo.dart';

class ListItem {
  final String title;
  final Widget widget;
  ListItem(this.title,this.widget);
}

void main() {
  runApp(MyApp(
    lists: [
      new ListItem('底部导航栏',BottomNavigationWidget()),
      new ListItem('不规则底部导航栏',BottomIrregularNavWidget()),
      new ListItem('路由切换动画',RouteSwitchEffect()),
      new ListItem('毛玻璃效果',FrostedDemoWidget()),
      new ListItem('保持页面状态',KeepAliveWidget()),
      new ListItem('一个不简单的搜索条',NotSimpleSearchBar()),
      new ListItem('流式布局模拟添加照片效果',AddingPhoneWidget()),
      new ListItem('展开闭合案例',ExpandColosedDemo()),
      new ListItem('展开闭合列表案例',ExpandClosedListDemo()),
      new ListItem('贝塞尔曲线切割',BezierCurveCutting()),
      // new ListItem('打开应用的闪屏动画案例',SplashScreenAnimation()),
      new ListItem('右滑返回上一页',SwipeRightToBack()),
      new ListItem('ToolTip控件',TooltipControlDemo()),
      new ListItem('Draggable控件',DraggableDemo()),
    ]
  ));
}

class MyApp extends StatelessWidget {
  final List<ListItem> lists;

  MyApp({Key key, @required this.lists}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter 练习列表')),
        body: Card(
          child: ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lists[index].title),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => lists[index].widget
                  ));
                },
              );
            },
          )
        ),
      )
    );
  }
}
