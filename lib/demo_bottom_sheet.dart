import 'package:flutter/material.dart';

class DemoBottomSheet extends StatefulWidget {
  @override
  _DemoBottomSheetState createState() => _DemoBottomSheetState();
}

class _DemoBottomSheetState extends State<DemoBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.greenAccent,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "昨天",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "今天",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "明天",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text("showBottomSheet"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("dismiss BottomSheet"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
