import 'package:flutter/material.dart';

// todo cross axis
class DemoRow extends StatefulWidget {
  @override
  _DemoRowState createState() => _DemoRowState();
}

class _DemoRowState extends State<DemoRow> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    _mainAxisAlignment = MainAxisAlignment.start;
                  });
                },
                child: Text("start"),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _mainAxisAlignment = MainAxisAlignment.end;
                  });
                },
                child: Text("end"),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _mainAxisAlignment = MainAxisAlignment.center;
                  });
                },
                child: Text("center"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    _mainAxisAlignment = MainAxisAlignment.spaceBetween;
                  });
                },
                child: Text("spaceBetween"),

                /// 在两端
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _mainAxisAlignment = MainAxisAlignment.spaceAround;
                  });
                },
                child: Text("spaceAround"),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                  });
                },
                child: Text("spaceEvenly"),

                /// 平均分
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.black87,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                Container(
                  width: 80,
                  color: Colors.greenAccent,
                ),
                Container(
                  width: 80,
                  color: Colors.blue,
                ),
                Container(
                  width: 80,
                  color: Colors.yellow,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
