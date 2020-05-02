import 'dart:math';

import 'package:awesome/state/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoProviderConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: ConsumerWidget(),
    );
  }
}

class ConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<TodoModel>(context, listen: false)
                  .addTodoList("add item${Random.secure().nextInt(100)}");
            },
          ),
        ],
      ),
      body: Consumer<TodoModel>(
        builder: (context, model, _) {
          /// 如果是 Consumer 那么只要一执行 notifyListeners 就会调用 builder 的方法

          debugPrint("DemoProviderConsumer 执行 builder 中的方法");

          return Container(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        child: Icon(
                          Icons.access_alarm,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "${model.todoList[index]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: model.todoList.length,
            ),
          );
        },
      ),
    );
  }
}
