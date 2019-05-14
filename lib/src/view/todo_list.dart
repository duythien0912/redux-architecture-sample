import 'package:flutter/material.dart';
import 'package:redux_architecture_sample/src/containers/app_loading.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/view/views.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      key: Key("AppLoading"),
      builder: (context, isLoading) {
        return isLoading
            ? Center(
          key: Key("LoadingIndicator"),
            child: CircularProgressIndicator())
            : _buildListView();
      },
    );
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];
          return TodoItem(
            todo: todo,
          );
        });
  }
}
