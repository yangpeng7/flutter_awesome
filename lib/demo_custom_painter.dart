import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class DemoCustomPainter extends StatefulWidget {
  @override
  _DemoCustomPainterState createState() => _DemoCustomPainterState();
}

class _DemoCustomPainterState extends State<DemoCustomPainter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPainter"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: SectorPainter(),
          ),
        ),
      ),
    );
  }
}

/// 画扇形组成的圆环
class SectorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 100;

    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: strokeWidth,
    );

    Paint paint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, -math.pi / 4, math.pi / 2, false, paint);

    canvas.drawArc(
        rect, math.pi / 4, math.pi / 2, false, paint..color = Colors.blue);

    canvas.drawArc(rect, math.pi / 4 * 3, math.pi / 2, false,
        paint..color = Colors.yellow);

    canvas.drawArc(
        rect, math.pi / 4 * 5, math.pi / 2, false, paint..color = Colors.pink);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 画扇形
class PathSectorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 100;
    Rect rect = Rect.fromLTWH(
        0.0, 0.0, size.width - strokeWidth / 2, size.height - strokeWidth / 2);

    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(rect, 0.0, math.pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 画圆弧
class PathArcToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Path path = Path();
    path.lineTo(30, 30);

    /// 可以看一下最后一个参数 true 和 false 的区别
//    path.arcTo(Rect.fromLTRB(0, 0, 100, 100), 0, math.pi, true);
    path.arcTo(Rect.fromLTRB(0, 0, 100, 100), 0, math.pi, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 通过 path 画线
/// 先 moveTo 再 relativeLineTo
/// relativeLineTo 和 lineTo 的区别是
/// relativeLineTo 从一个点到一个基于当前点的偏移量
/// lineTo 画的是从一个点到另一个点
class PathRelativeLineToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 需设置style
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Path path = Path();
    path.moveTo(100, 100);
    path.relativeLineTo(200, 200);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 通过 path 画线
/// 先 moveTo 再 lineTo
class PathMoveToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 需设置style
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    /// 先移动到100、100
    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 通过 path 画线
/// lineTo
class PathLineToPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 需设置style
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Path path = Path();
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 画椭圆
class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(Rect.fromLTRB(0, 0, 100, 50), Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 画圆弧
class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 根据左、上、右、下 构建一个矩形
    canvas.drawArc(Rect.fromLTRB(0, 0, 100, 100), 0, math.pi, true,
        Paint()..color = Colors.blue);

    /// 根据 圆 构建一个矩形
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: 100),
        0,
        math.pi / 2,
        false,
        Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 画线
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0, 0),
        Offset(0, 100),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 20);

    canvas.drawLine(
        Offset(0, 0),
        Offset(100, 0),
        Paint()
          ..color = Colors.green
          ..strokeWidth = 30);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// 画圆
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// offset 是圆心的 offset
    canvas.drawCircle(Offset(0, 0), 30, Paint()..color = Colors.red);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 30,
        Paint()..color = Colors.green);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
