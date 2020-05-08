import 'package:flutter/material.dart';

class DemoScrollController extends StatefulWidget {
  @override
  _DemoScrollControllerState createState() => _DemoScrollControllerState();
}

class _DemoScrollControllerState extends State<DemoScrollController> {
  String _scrollStatus = "";

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      debugPrint("${_scrollController.position.maxScrollExtent}");
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        debugPrint("scroll to bottom");

        setState(() {
          _scrollStatus = "Bottom !";
        });
      } else if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _scrollStatus = "Top !";
        });
      } else {
        setState(() {
          _scrollStatus = _scrollController.offset.toString();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

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
            child: ListView.builder(
              controller: _scrollController,
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
          )
        ],
      ),
    );
  }
}
