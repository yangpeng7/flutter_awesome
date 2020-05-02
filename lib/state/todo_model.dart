import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  String _createDate = "今天";
  List<String> _todoList = [];

  List<String> get todoList => _todoList;

  String get createDate => _createDate;

  TodoModel() {
    initTodoList();
  }

  /// 初始化todoList
  Future<void> initTodoList() async {
    await Future.delayed(Duration(seconds: 1));

    List<String> list = List.generate(5, (index) {
      return "init todo $index";
    });
    _todoList.addAll(list);
    notifyListeners();
  }

  /// todoList增加值
  Future<void> addTodoList(String todo) async {
    await Future.delayed(Duration(seconds: 1));
    _todoList.add(todo);
    notifyListeners();
  }
}
