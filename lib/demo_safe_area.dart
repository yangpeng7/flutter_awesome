import 'package:flutter/material.dart';

class DemoSafeArea extends StatefulWidget {
  @override
  _DemoSafeAreaState createState() => _DemoSafeAreaState();
}

class _DemoSafeAreaState extends State<DemoSafeArea> {
  bool _hasSafeArea = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hasSafeArea ? _buildWithSafeArea() : _buildWithoutSafeArea(),
    );
  }

  Widget _buildWithSafeArea() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "with SafeArea",
              style: TextStyle(fontSize: 15),
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            padding: EdgeInsets.all(20),
            child: Text(
              "切换为无SafeArea",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                _hasSafeArea = !_hasSafeArea;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWithoutSafeArea() {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            "without SafeArea",
            style: TextStyle(fontSize: 15),
          ),
        ),
        RaisedButton(
          color: Colors.blue,
          padding: EdgeInsets.all(20),
          child: Text(
            "切换为SafeArea",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              _hasSafeArea = !_hasSafeArea;
            });
          },
        ),
      ],
    );
  }
}
