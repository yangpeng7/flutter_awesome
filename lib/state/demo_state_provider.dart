import 'package:awesome/state/demo_state_provider_consumer.dart';
import 'package:awesome/state/demo_state_provider_selector.dart';
import 'package:flutter/material.dart';

class DemoStateProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider 状态管理"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DemoProviderConsumer()),
                );
              },
              child: Text(
                "Consumer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DemoProviderSelector()),
                );
              },
              child: Text(
                "Selector",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
