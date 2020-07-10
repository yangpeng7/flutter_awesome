import 'package:flutter/material.dart';

class DemoContainer extends StatefulWidget {
  @override
  _DemoContainerState createState() => _DemoContainerState();
}

class _DemoContainerState extends State<DemoContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Text("Container"),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
