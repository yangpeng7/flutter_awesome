import 'package:flutter/material.dart';

class DemoButton extends StatefulWidget {
  @override
  _DemoButtonState createState() => _DemoButtonState();
}

class _DemoButtonState extends State<DemoButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            /// Material Design风格的Button
            RaisedButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Text(
                'RaisedButton',
                style: TextStyle(color: Colors.black),
              ),
            ),

            /// 扁平的 Button
            FlatButton(
              onPressed: () {},
              color: Colors.red,
              child: Text(
                "FlatButton",
                style: TextStyle(color: Colors.white),
              ),
            ),

            /// 带边框的 Button
            OutlineButton(
              onPressed: () {},
              child: Text(
                "OutlineButton",
                style: TextStyle(color: Colors.blue),
              ),
            ),

            IconButton(
              onPressed: () {},
              color: Colors.deepOrange,
              icon: Icon(Icons.headset),
            ),
          ],
        ),
      ),
    );
  }
}
