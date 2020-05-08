import 'package:awesome/demo_bottom_navigation_bar.dart';
import 'package:awesome/demo_bottom_sheet.dart';
import 'package:awesome/demo_button.dart';
import 'package:awesome/demo_clip_rrect.dart';
import 'package:awesome/demo_column.dart';
import 'package:awesome/demo_custom_scroll_view.dart';
import 'package:awesome/demo_drawer.dart';
import 'package:awesome/demo_expanded.dart';
import 'package:awesome/demo_modal_bottom_sheet.dart';
import 'package:awesome/demo_offstage.dart';
import 'package:awesome/demo_pop_menu_button.dart';
import 'package:awesome/demo_refresh_indicator.dart';
import 'package:awesome/demo_refresh_load_more.dart';
import 'package:awesome/demo_row.dart';
import 'package:awesome/demo_safe_area.dart';
import 'package:awesome/demo_scroll_controller.dart';
import 'package:awesome/demo_scroll_notification.dart';
import 'package:awesome/demo_sliver_app_bar_advance.dart';
import 'package:awesome/demo_sliver_app_bar_basic.dart';
import 'package:awesome/demo_stack.dart';
import 'package:awesome/demo_visibility.dart';
import 'package:awesome/state/demo_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'demo_custom_time_picker.dart';

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

class Title extends StatelessWidget {
  final String text;

  const Title({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

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
        style: TextStyle(
          color: Colors.lightBlue,
          fontSize: 18,
        ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
//          https://medium.com/@aneesshameed/flutter-custom-painter-circles-4fbc68ae7c13
//        https://medium.com/@aneesshameed/flutter-custom-painter-bc17fa70531b
          Title(text: "UI基础"),
          ClickButton(
            text: "Button",
            targetPage: DemoButton(),
          ),
          ClickButton(
            text: "ClipRRect",
            targetPage: DemoClipRRect(),
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
            text: "Expanded",
            targetPage: DemoExpanded(),
          ),
          ClickButton(
            text: "Stack",
            targetPage: DemoStack(),
          ),
          ClickButton(
            text: "Visibility",
            targetPage: DemoVisibility(),
          ),
          ClickButton(
            text: "Offstage",
            targetPage: DemoOffstage(),
          ),
          ClickButton(
            text: "SafeArea",
            targetPage: DemoSafeArea(),
          ),
          ClickButton(
            text: "PopupMenuButton",
            targetPage: DemoPopupMenuButton(),
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

          ClickButton(
            text: "BottomNavigationBar",
            targetPage: DemoBottomNavigationBar(),
          ),
          ClickButton(
            text: "Drawer",
            targetPage: DemoDrawer(),
          ),
          Title(text: "UI进阶"),
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
            text: "Scroll Controller",
            targetPage: DemoScrollController(),
          ),
          ClickButton(
            text: "Scroll Notification",
            targetPage: DemoScrollNotification(),
          ),
          ClickButton(
            text: "Refresh Load More",
            targetPage: DemoRefreshLoadMore(),
          ),
          Title(text: "自定义"),
          ClickButton(
            text: "Custom Time Picker",
            targetPage: DemoCustomTimePicker(),
          ),
          Title(text: "状态管理"),
          ClickButton(
            text: "State Provider",
            targetPage: DemoStateProvider(),
          ),
        ],
      ),
    );
  }
}
