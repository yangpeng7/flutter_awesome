import 'package:flutter/material.dart';

class DemoBottomNavigationBar extends StatefulWidget {
  @override
  _DemoBottomNavigationBarState createState() =>
      _DemoBottomNavigationBarState();
}

class ColorWidget extends StatelessWidget {
  final Color color;

  ColorWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class _DemoBottomNavigationBarState extends State<DemoBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ColorWidget(Colors.greenAccent),
    ColorWidget(Colors.deepOrange),
    ColorWidget(Colors.yellow)
  ];

  _onTabClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '底部导航',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        onTap: _onTabClick,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text('消息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的'),
          )
        ],
      ),
    );
  }
}
