import 'package:flutter/material.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class LoadTodosAction {}

class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction({this.todos});

  @override
  String toString() {
    return 'TodosLoadedAction{todos: $todos}';
  }
}

class TodosNotLoadedAction {}

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);

  @override
  String toString() {
    return 'AddTodoAction{todo: $todo}';
  }
}

class UpdateTabAction{
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}

class ChangeAppTheme {
  final ThemeData themeData;

  ChangeAppTheme({@required this.themeData});

  @override
  String toString() {
    return 'ChangeAppTheme: ${this.themeData}';
  }
}

class TurnOnDarkThemeAction {}

class TurnOffDarkThemeAction {}
