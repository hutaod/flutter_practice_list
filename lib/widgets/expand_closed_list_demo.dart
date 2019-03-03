import 'package:flutter/material.dart';

class ExpandClosedListDemo extends StatefulWidget {
  _ExpandClosedListDemoState createState() => _ExpandClosedListDemoState();
}

class _ExpandClosedListDemoState extends State<ExpandClosedListDemo> {
  var currentPanelIndex = -1;
  List<int> mList;
  List<ExpandStateBean> expandStateList;

  _ExpandClosedListDemoState(){
    mList = new List();
    expandStateList = new List();
    for (var i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand){
    setState(() {
      expandStateList.forEach((item){
        if(item.index==index){
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('展开闭合列表案例'),),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol){
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context, isExpand){
                return ListTile(title: Text('This is No. $index'));
              },
              body: ListTile(
                title: Text('expansion is no.$index'),
              ),
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBean {
  var index;
  var isOpen;
  ExpandStateBean(this.index,this.isOpen);
}