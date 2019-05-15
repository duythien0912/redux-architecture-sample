import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/containers/tab_selector/tab_selector_viewmodel.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class TabSelector extends StatelessWidget {
  TabSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TabSelectorVM>(
      distinct: true,
      converter: (Store<AppState> store) => TabSelectorVM.fromStore(store),
      builder: (BuildContext context, TabSelectorVM viewModel) {
        return BottomNavigationBar(
            currentIndex: AppTab.values.indexOf(viewModel.activeTab),
            onTap: viewModel.onTabSelected,
            items: AppTab.values.map((tab) {
              return BottomNavigationBarItem(
                  icon: Icon(
                      tab == AppTab.todos ? Icons.list : Icons.show_chart,
                      key: tab == AppTab.todos
                          ? Key('__todoTab__')
                          : Key('__statsTab__')),
                  title: Text(tab == AppTab.todos ? "Todos" : "Stats"));
            }).toList());
      },
    );
  }
}
