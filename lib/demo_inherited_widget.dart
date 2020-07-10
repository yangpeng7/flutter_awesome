import 'package:flutter/material.dart';

/// 官方文档说明
///https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html

/// 显示九点下班
//class DemoInheritedWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("DemoDemoInheritedWidget"),
//      ),
//      body: DemoInheritedWidgetParent(
//        "九点下班",
//        child: Child(),
//      ),
//    );
//  }
//}

/// 显示六点下班
class DemoInheritedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DemoDemoInheritedWidget"),
      ),
      body: DemoInheritedWidgetParent(
        "九点下班",
        child: DemoInheritedWidgetParent(
          "六点下班",
          child: Child(),
        ),
      ),
    );
  }
}

class DemoInheritedWidgetParent extends InheritedWidget {
  final String name;

  DemoInheritedWidgetParent(this.name, {Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(DemoInheritedWidgetParent oldWidget) {
    return name == oldWidget.name;
  }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = context
        .dependOnInheritedWidgetOfExactType<DemoInheritedWidgetParent>()
        .name;
    return Center(
      child: Container(
        child: Text("name:$name"),
      ),
    );
  }
}
