import 'package:flutter/material.dart';

// todo cross axis
class DemoColumn extends StatefulWidget {
  @override
  _DemoColumnState createState() => _DemoColumnState();
}

class _DemoColumnState extends State<DemoColumn> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            child: Column(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                Container(
                  height: 80,
                  color: Colors.greenAccent,
                ),
                Container(
                  height: 80,
                  color: Colors.blue,
                ),
                Container(
                  height: 80,
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
