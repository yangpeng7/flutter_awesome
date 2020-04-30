import 'package:awesome/demo_bottom_navigation_bar.dart';
import 'package:awesome/demo_bottom_sheet.dart';
import 'package:awesome/demo_column.dart';
import 'package:awesome/demo_custom_scroll_view.dart';
import 'package:awesome/demo_expanded.dart';
import 'package:awesome/demo_modal_bottom_sheet.dart';
import 'package:awesome/demo_refresh_indicator.dart';
import 'package:awesome/demo_row.dart';
import 'package:awesome/demo_scroll_controller.dart';
import 'package:awesome/demo_scroll_notification.dart';
import 'package:awesome/demo_sliver_app_bar_advance.dart';
import 'package:awesome/demo_sliver_app_bar_basic.dart';
import 'package:flutter/cupertino.dart';
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

typedef onNextPage = void Function(String name);

class ClickButton extends StatelessWidget {
  final String text;
  final Widget targetPage;

  const ClickButton({Key key, @required this.text, @required this.targetPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return targetPage;
            },
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.lightBlue),
      ),
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
  void _gotoNextPage(BuildContext buildContext, Widget targetPage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return targetPage;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          CupertinoActivityIndicator(),
          ClickButton(
            text: "BottomNavigationBar",
            targetPage: DemoBottomNavigationBar(),
          ),
          ClickButton(
            text: "SliverAppBar Basic",
            targetPage: DemoSliverAppBarBasic(),
          ),
          ClickButton(
            text: "SliverAppBar advance",
            targetPage: DemoSliverAppBarAdvance(),
          ),
          ClickButton(
            text: "CustomScrollView",
            targetPage: DemoCustomScrollView(),
          ),
          ClickButton(
            text: "Expanded",
            targetPage: DemoExpanded(),
          ),
          ClickButton(
            text: "Scroll Controller",
            targetPage: DemoScrollController(),
          ),
          ClickButton(
            text: "Scroll Notification",
            targetPage: DemoScrollNotification(),
          ),
          ClickButton(
            text: "Column",
            targetPage: DemoColumn(),
          ),
          ClickButton(
            text: "Row",
            targetPage: DemoRow(),
          ),
          ClickButton(
            text: "Bottom Sheet",
            targetPage: DemoBottomSheet(),
          ),
          ClickButton(
            text: "Bottom Modal Sheet",
            targetPage: DemoModalBottomSheet(),
          ),
          ClickButton(
            text: "Refresh Indicator",
            targetPage: DemoRefreshIndicator(),
          ),
        ],
      ),
    );
  }
}
