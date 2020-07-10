import 'package:flutter/material.dart';

class DemoNavigationRail extends StatefulWidget {
  @override
  _DemoNavigationRailState createState() => _DemoNavigationRailState();
}

class _DemoNavigationRailState extends State<DemoNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavigationRail"),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            groupAlignment: 1,

            /// 显示在头部
            leading: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    debugPrint("xx");
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),

            /// 显示在尾部
            trailing: SizedBox(
              height: 30,
            ),
            destinations: [
              NavigationRailDestination(
                icon: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                  ),
                ),
                selectedIcon: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Icon(Icons.insert_drive_file),
                  ),
                ),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text("全部文件"),
                ),
              ),
              NavigationRailDestination(
                icon: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                  ),
                ),
                selectedIcon: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Icon(Icons.videocam),
                  ),
                ),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text("视频"),
                ),
              ),
              NavigationRailDestination(
                icon: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Icon(
                      Icons.image,
                      color: Colors.red,
                    ),
                  ),
                ),
                selectedIcon: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Icon(Icons.image),
                  ),
                ),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text("图片"),
                ),
              ),
            ],
            selectedIndex: 1,
            labelType: NavigationRailLabelType.all,
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: Center(
              child: Text("data"),
            ),
          )
        ],
      ),
    );
  }
}
