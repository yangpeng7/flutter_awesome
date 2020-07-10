import 'package:flutter/material.dart';

class DemoClip extends StatefulWidget {
  @override
  _DemoClipState createState() => _DemoClipState();
}

class _DemoClipState extends State<DemoClip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clip"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                /// 裁剪出一个圆
                ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.greenAccent,
                  ),
                ),
                Divider(),

                /// 裁剪出一个椭圆
                ClipOval(
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.greenAccent,
                  ),
                ),
                Divider(),

                /// 圆角矩形
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.greenAccent,
                  ),
                ),
                Divider(),

                /// 自定义 path 切一个三角形
                ClipPath(
                  clipper: TrianglePathClipper(),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.greenAccent,
                  ),
                ),
                Divider(),

                /// 自定义 Rect 切矩形
                ClipRect(
                  clipper: CustomRectClipper(),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.greenAccent,
                  ),
                ),
                Divider(),
                ClipPath(
                  clipper: InnerCircleClipper(),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.greenAccent,
                  ),
                ),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 自定义 path
class TrianglePathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

/// 自定义 Rect
class CustomRectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    /// 只保留此部分
    return Rect.fromLTWH(0, 0, 80, 80);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

/// 中间裁剪一个圆形，这里的重点是 fillType 选择 evenOdd
/// 关于 [nonZero] 和 [evenOdd] 可以参考
/// https://www.zhangxinxu.com/wordpress/2018/10/nonzero-evenodd-fill-mode-rule/
class InnerCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    /// 定义一个矩形
    path.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    /// 定义一个圆
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width * 0.2));

    /// 这里是重点
    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
