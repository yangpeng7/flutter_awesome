import 'dart:math';

import 'package:awesome/state/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoProviderSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: SelectorWidget(),
    );
  }
}

class SelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selector"),
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
      body: Selector<TodoModel, List<String>>(builder: (context, list, child) {
        debugPrint("DemoProviderSelector 执行 builder 中的方法");

        /// 可以看到这里是不会执行的 点击add按钮这里 是不会执行的 因为 TodoModel中
        /// todoList 尽管数据变了，但是内存地址没变，所以说 Selector 用于不可变的对象或者基本的数据类型

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
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Icon(
                        Icons.access_alarm,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "${list[index]}",
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
            itemCount: list.length,
          ),
        );
      }, selector: (context, model) {
        return model.todoList;
      }),
    );
  }
}
