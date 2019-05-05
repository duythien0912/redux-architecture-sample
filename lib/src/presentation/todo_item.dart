import 'package:flutter/material.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Hero(
        tag: '${todo.id}__heroTag',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            todo.task,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      subtitle: Text(
        todo.note,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subhead,
      ),
    );
  }
}
