import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/containers/active_tab.dart';
import 'package:redux_architecture_sample/src/containers/containers.dart';
import 'package:redux_architecture_sample/src/locale/locale_export.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return ActiveTab(
      onInit: (store) {
//        store.dispatch(LoadTodosAction());
      },
      builder: (BuildContext context, AppTab activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text("TODOS"),
            actions: <Widget>[],
          ),
//          body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: TabSelector(),
        );
      },
    );
  }
}
