import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/selectors/selectors.dart';

class AppLoading extends StatelessWidget{
  final Function(BuildContext context, bool isLoading) builder;

  const AppLoading({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (Store<AppState> store) => isLoadingSelector(store.state),
      builder: builder,
    );
  }
}