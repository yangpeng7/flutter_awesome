import 'package:awesome/demo_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DemoLifecycle extends StatefulWidget {
  @override
  _DemoLifecycleState createState() {
    debugPrint("createState");
    return _DemoLifecycleState();
  }
}

class _DemoLifecycleState extends State<DemoLifecycle> with WidgetsBindingObserver{
  int _clickCount = 0;

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
    WidgetsBinding.instance.addObserver(this);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      /// frame 渲染完成
      debugPrint("addPostFrameCallback $timeStamp");
    });
  }

  @override
  Future<bool> didPushRoute(String route) {
    debugPrint("didPushRoute $route");
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    debugPrint("didPopRoute");
    return super.didPopRoute();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("didChangeAppLifecycleState $state");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// 在 initState 之后执行
    debugPrint("didChangeDependencies");
  }

  @override
  void didUpdateWidget(DemoLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose");
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("$_clickCount"),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _clickCount++;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DemoRow();
                      }),
                    );
                  },
                  child: Text("click"),
                ),
              ],
            ),
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
