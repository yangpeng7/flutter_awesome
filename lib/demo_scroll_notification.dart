import 'package:flutter/material.dart';

class DemoScrollNotification extends StatefulWidget {
  @override
  _DemoScrollNotificationState createState() => _DemoScrollNotificationState();
}

class _DemoScrollNotificationState extends State<DemoScrollNotification> {
  String _scrollStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("scroll offset $_scrollStatus"),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  setState(() {
                    _scrollStatus = "ScrollStart !";
                  });
                } else if (notification is ScrollUpdateNotification) {
                  setState(() {
                    _scrollStatus = notification.metrics.pixels.toString();
                  });
                } else if (notification is ScrollEndNotification) {
                  setState(() {
                    _scrollStatus = "ScrollEnd !";
                  });
                }

                return true;
              },
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.lightBlue[100 * (index % 10)],
                    height: 100,
                    child: Center(
                      child: Text("item $index"),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
