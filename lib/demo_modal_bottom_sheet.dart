import 'package:flutter/material.dart';

class DemoModalBottomSheet extends StatefulWidget {
  @override
  _DemoModalBottomSheetState createState() => _DemoModalBottomSheetState();
}

class _DemoModalBottomSheetState extends State<DemoModalBottomSheet> {

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
                    /// 模态BottomSheet 默认增加一个蒙板
                    showModalBottomSheet(
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
                  child: Text("showModalBottomSheet"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
