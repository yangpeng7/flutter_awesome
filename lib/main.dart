import 'package:awesome/demo_bottom_navigation_bar.dart';
import 'package:awesome/demo_custom_scroll_view.dart';
import 'package:awesome/demo_expanded.dart';
import 'package:awesome/demo_sliver_app_bar_advance.dart';
import 'package:awesome/demo_sliver_app_bar_basic.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Awesome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DemoBottomNavigationBar();
                }),
              );
            },
            child: Text(
              "BottomNavigationBar",
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DemoSliverAppBarBasic();
                }),
              );
            },
            child: Text(
              "SliverAppBar Basic",
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DemoSliverAppBarAdvance();
                }),
              );
            },
            child: Text(
              "SliverAppBar advance",
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DemoCustomScrollView();
                }),
              );
            },
            child: Text(
              "CustomScrollView",
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DemoExpanded();
                }),
              );
            },
            child: Text(
              "Expanded",
              style: TextStyle(color: Colors.lightBlue),
            ),
          )
        ],
      ),
    );
  }
}
