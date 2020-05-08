import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoCustomTimePicker extends StatefulWidget {
  @override
  _DemoCustomTimePickerState createState() => _DemoCustomTimePickerState();
}

class _DemoCustomTimePickerState extends State<DemoCustomTimePicker> {
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return MultiPicker(
                    onCancel: () {},
                    onConfirm: (time) {
                      setState(() {
                        _text = time;
                      });
                    },
                  );
                },
              );
            },
            child: Text("选择时间"),
          ),
          Text(_text),
        ],
      ),
    );
  }
}

typedef OnTimeSelected = void Function(String time);

class MultiPicker extends StatelessWidget {
  final VoidCallback onCancel;
  final OnTimeSelected onConfirm;

  const MultiPicker({Key key, this.onCancel, this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _hour = 0;
    int _minute = 0;

    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onCancel != null) {
                    onCancel();
                  }
                },
                child: Text(
                  "取消",
                  style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onConfirm != null) {
                    onConfirm("$_hour:$_minute");
                  }
                },
                child: Text(
                  "完成",
                  style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  child: CupertinoPicker(
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    backgroundColor: Colors.transparent,
                    looping: true,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      _hour = index;
                    },
                    children: List.generate(
                      24,
                      (index) {
                        return Container(
                          child: Text("$index 点"),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: CupertinoPicker(
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    backgroundColor: Colors.transparent,
                    looping: true,
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      _minute = index;
                    },
                    children: List.generate(
                      60,
                      (index) {
                        return Container(
                          child: Text("$index 分"),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
