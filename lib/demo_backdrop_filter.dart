import 'dart:ui';

import 'package:flutter/material.dart';

class DemoBackdropFilter extends StatefulWidget {
  @override
  _DemoBackdropFilterState createState() => _DemoBackdropFilterState();
}

//class _DemoBackdropFilterState extends State<DemoBackdropFilter> {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      home: new Container(
//        decoration: new BoxDecoration(
//            image: new DecorationImage(
//                image: new NetworkImage(
//                    "https://images.pexels.com/photos/668196/pexels-photo-668196.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
//                fit: BoxFit.cover)),
//        child: new Center(
//          child: new ClipRect(
//            child: new SizedBox(
//              height: 200.0,
//              width: 200.0,
//              child: new BackdropFilter(
//                filter: ImageFilter.blur(
//                  sigmaX: 5.0,
//                  sigmaY: 5.0,
//                ),
//                child: new Center(
//                  child: new Text("Hi"),
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}

class _DemoBackdropFilterState extends State<DemoBackdropFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("BackdropFilter"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(
                  "http://t7.baidu.com/it/u=3616242789,1098670747&fm=79&app=86&f=JPEG?w=900&h=1350"),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRect(
            child: Container(
              width: 100,
              height: 100,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: FlatButton(
                  child: Text("hello world"),
//                  child: Icon(Icons.ac_unit),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
