import 'package:flutter/material.dart';

class DemoExpanded extends StatefulWidget {
  @override
  _DemoExpandedState createState() => _DemoExpandedState();
}

class _DemoExpandedState extends State<DemoExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: Column(
        children: <Widget>[
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.home),
              Container(
                height: 60,
                color: Colors.lightBlue,
                alignment: Alignment.center,
                child: Text(
                  "no expanded",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Icon(Icons.list),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.home),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: Text(
                    "expanded",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Icon(Icons.list),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.home),
              Expanded(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: Text(
                    "flex 2",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Icon(Icons.add),
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: Text(
                    "flex 1",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Icon(Icons.list),
            ],
          ),
        ],
      ),
    );
  }
}
