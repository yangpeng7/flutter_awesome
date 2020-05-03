import 'package:flutter/material.dart';

class DemoOffstage extends StatefulWidget {
  @override
  _DemoOffstageState createState() => _DemoOffstageState();
}

class _DemoOffstageState extends State<DemoOffstage> {
  bool offstage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offstage"),
      ),
      body: ListView(
        children: <Widget>[
          Offstage(
            offstage: offstage,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                "Container status $offstage",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                offstage = !offstage;
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
