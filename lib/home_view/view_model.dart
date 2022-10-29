import 'package:flutter/material.dart';
import 'package:personal_work/models/todos.dart';

class HomeViewModel with ChangeNotifier {
  var index = 1;

  List<Todo> addTodo = [];

  void addNewTodo(String title, String dueDate) {
    print("created");
    addTodo.add(Todo(index, title, dueDate));
    index++;
    notifyListeners();
  }

  void removeTodo(int i) {
    addTodo.removeAt(i);
    notifyListeners();
  }

  bool isChecked = false;
  void checkboxToggle(bool? newValue) {
    print("tapped");
    isChecked = !newValue!;
    notifyListeners();
  }
}
