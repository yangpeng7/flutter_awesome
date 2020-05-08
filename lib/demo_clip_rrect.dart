import 'package:flutter/material.dart';

class DemoClipRRect extends StatefulWidget {
  @override
  _DemoClipRRectState createState() => _DemoClipRRectState();
}

class _DemoClipRRectState extends State<DemoClipRRect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("九点下班"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Divider(),

          /// The [child] is not clipped to the decoration. To clip a child to the shape
          /// of a particular [ShapeDecoration], consider using a [ClipPath] widget.
          /// child 不会被裁剪
          Container(
            width: 100,
            height: 100,
            child: Image.network(
                "https://i.loli.net/2020/05/08/XoLUmcedY8hsywv.png"),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Divider(),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              width: 100,
              height: 100,
              child: Image.network(
                  "https://i.loli.net/2020/05/08/XoLUmcedY8hsywv.png"),
            ),
          ),
          Divider(),
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                  "https://i.loli.net/2020/05/08/XoLUmcedY8hsywv.png"),
            ),
          ),
          Divider(),
          Container(
            width: 100,
            height: 100,
            child: Image.network(
                "https://i.loli.net/2020/05/08/XoLUmcedY8hsywv.png"),
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: Border.all(
                    color: Colors.red,
                    width: 5,
                  ) +
                  Border.all(
                    color: Colors.yellow,
                    width: 5,
                  ) +
                  Border.all(
                    color: Colors.blue,
                    width: 5,
                  ),
            ),
          ),
          Divider(),
          Container(
            width: 100,
            height: 100,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://i.loli.net/2020/05/08/XoLUmcedY8hsywv.png"),
              ),
              shape: Border.all(
                    color: Colors.red,
                    width: 5,
                  ) +
                  Border.all(
                    color: Colors.yellow,
                    width: 5,
                  ) +
                  Border.all(
                    color: Colors.blue,
                    width: 5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
