import 'package:flutter/material.dart';

class AddingPhoneWidget extends StatefulWidget {
  _AddingPhoneWidgetState createState() => _AddingPhoneWidgetState();
}

class _AddingPhoneWidgetState extends State<AddingPhoneWidget> {

  List<Widget> list;

  void initState() { 
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Wrap流式布局'),),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 26.0,
            ),
          ),
        )
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: (){
        if(list.length<9) {
          setState(() {
            list.insert(list.length-1, buildPhone()); 
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.redAccent,
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  Widget buildPhone() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }


}