import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class ActiveTab extends StatelessWidget {
  final ViewModelBuilder<AppTab> builder;
  final void Function(Store<AppState> store) onInit;
  final void Function(Store<AppState> store) onDispose;

  const ActiveTab({Key key, this.onInit, this.builder, this.onDispose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppTab>(
      onInit: onInit,
      onDispose: onDispose,
      distinct: true,
      converter: (Store<AppState> store) => store.state.activeTab,
      builder: builder,
    );
  }
}
