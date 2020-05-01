import 'package:flutter/material.dart';

class DemoRefreshIndicator extends StatefulWidget {
  @override
  _DemoRefreshIndicatorState createState() => _DemoRefreshIndicatorState();
}

class _DemoRefreshIndicatorState extends State<DemoRefreshIndicator> {
  int _count = 10;

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));

    if (this.mounted) {
      setState(() {
        _count += 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: _count,
          itemExtent: 60,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.lightBlue[100 * (index % 10 + 1)],
            );
          },
        ),
        onRefresh: _handleRefresh,
      ),
    );
  }
}
