import 'package:flutter/material.dart';

class DemoSliverAppBarBasic extends StatefulWidget {
  @override
  _DemoSliverAppBarBasicState createState() => _DemoSliverAppBarBasicState();
}

class _DemoSliverAppBarBasicState extends State<DemoSliverAppBarBasic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical, // 默认 Axis.vertical 还有 Axis.horizontal
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(icon: Icon(Icons.list), onPressed: null),
            title: Text("九点下班"),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: null),
              IconButton(icon: Icon(Icons.more_vert), onPressed: null),
            ],
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "http://attach.bbs.miui.com/forum/201305/30/220025pxfkhykvkgkvuktq.jpg",
                fit: BoxFit.cover,
              ),
//              title: Text("九点上班"),
              centerTitle: true,
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 10)],
                  child: Text("List Item $index"),
                );
              },
              childCount: 20,
            ),
            itemExtent: 60,
          ),
        ],
      ),
    );
  }
}
