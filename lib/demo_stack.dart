import 'package:flutter/material.dart';

class DemoStack extends StatefulWidget {
  @override
  _DemoStackState createState() => _DemoStackState();
}

class _DemoStackState extends State<DemoStack> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.yellow,
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Text(
              "Stack right:10 bottom:10",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            left: 100,
            top: 100,
            child: Text(
              "Stack left:100 top:100",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
