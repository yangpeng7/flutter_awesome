import 'package:flutter/material.dart';

class DemoVisibility extends StatefulWidget {
  @override
  _DemoVisibilityState createState() => _DemoVisibilityState();
}

class _DemoVisibilityState extends State<DemoVisibility> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visibility"),
      ),
      body: ListView(
        children: <Widget>[
          Visibility(
            visible: visibility,

            /// child 不可见时显示的内容
            replacement: Icon(
              Icons.remove_red_eye,
              color: Colors.red,
            ),

            /// 不可见时是否保留空间，设置为 true 时 maintainAnimation 也要设置为 true，maintainState 也要为true
            maintainSize: true,

            maintainAnimation: true,

            /// 不可见时是否保持状态，设置为true会有新能消耗
            maintainState: true,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                "Container status $visibility",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                visibility = !visibility;
              });
            },
            color: Colors.blue,
            child: Text(
              '设置 Container 显示状态',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
