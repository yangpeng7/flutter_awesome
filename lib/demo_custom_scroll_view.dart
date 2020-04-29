import 'package:flutter/material.dart';

class DemoCustomScrollView extends StatefulWidget {
  @override
  _DemoCustomScrollViewState createState() => _DemoCustomScrollViewState();
}

class _DemoCustomScrollViewState extends State<DemoCustomScrollView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical, // 默认 Axis.vertical 还有 Axis.horizontal
        slivers: <Widget>[
          // 给 CustomScrollView 增加 SliverAppBar
          SliverAppBar(
            // leading 接收一个widget
            leading: IconButton(icon: Icon(Icons.list), onPressed: null),
            title: Text("九点下班"),
            elevation: 0,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: null),
              IconButton(icon: Icon(Icons.map), onPressed: null),
              IconButton(icon: Icon(Icons.more_vert), onPressed: null),
            ],
            //是否钉住
            pinned: true,
            // 是否马上可见
            floating: true,
            //用的比较少只有floating时生效
//          snap: true,
            // SliverAppBar 完全可见的高度
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "http://attach.bbs.miui.com/forum/201305/30/220025pxfkhykvkgkvuktq.jpg",
                fit: BoxFit.cover,
              ),
//            title: Text("title"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 100,
                    color: Colors.primaries[index],
                  );
                },
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.red[100 * (index % 10)],
                  child: Text("Grid Item $index"),
                );
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2, //比例
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.lightBlue[100 * (index % 10)],
                );
              },
              childCount: 10,
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.pink[100 * (index % 10)],
                    child: Text("List Item $index"),
                  );
                },
                childCount: 10,
              ),
              itemExtent: 60),
        ],
      ),
    );
  }
}
