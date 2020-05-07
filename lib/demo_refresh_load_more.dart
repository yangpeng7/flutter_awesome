import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoRefreshLoadMore extends StatefulWidget {
  @override
  _DemoRefreshLoadMoreState createState() => _DemoRefreshLoadMoreState();
}

class _DemoRefreshLoadMoreState extends State<DemoRefreshLoadMore> {
  ScrollController _scrollController = ScrollController();
  final int _totalItems = 30;
  List<String> _items = [];

  _clickToRefresh() {
    _refresh();

    ///滚动回顶部
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  /// 下拉刷新
  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));

    List<String> list = List.generate(15, (index) {
      return "item $index";
    });

    setState(() {
      _items = list;
    });
  }

  /// 加载更多
  Future<void> _loadMore() async {
    if (_items.length >= _totalItems) {
      return;
    }
    await Future.delayed(Duration(seconds: 2));

    List<String> list = List.generate(15, (index) {
      return "more item $index";
    });

    setState(() {
      _items.addAll(list);
    });
  }

  Widget _bottomWidget() {
    return _items.length < _totalItems
        ? Container(
            height: 60,
            child: CupertinoActivityIndicator(),
          )
        : Container(
            height: 60,
            alignment: Alignment.center,
            child: Text("我是有底线的"),
          );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ///滚动到底部加载更多
        _loadMore();
      }
    });
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh and Load More"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _clickToRefresh(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          controller: _scrollController,
          itemBuilder: (context, index) {
            return (index == _items.length

                /// 显示更多
                ? _bottomWidget()
                : Container(
                    height: 60,
                    alignment: Alignment.center,
                    color: Colors.amber[100 * (index % 9 + 1)],
                    child: Text(
                      _items[index],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ));
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: _items.length == 0 ? 0 : _items.length + 1,
        ),
      ),
    );
  }
}
