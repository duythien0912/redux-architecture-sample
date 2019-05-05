import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

final tabsReducer = combineReducers<AppTab>(
    [TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer)]
);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) => action.newTab;
