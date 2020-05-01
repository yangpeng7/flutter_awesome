import 'package:flutter/material.dart';

class DemoDrawer extends StatefulWidget {
  @override
  _DemoDrawerState createState() => _DemoDrawerState();
}

class _DemoDrawerState extends State<DemoDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.loli.net/2019/08/11/hE2r4ztxvPVundA.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text(
                      "九点下班",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                '个人中心',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.location_on,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '版本升级',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.access_alarms,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text(
                '切换主题',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.group_work,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '关于我们',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.email,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            Divider(),
          ],
        ),
      ),
      body: Container(
        color: Colors.blue[200],
      ),
    );
  }
}
