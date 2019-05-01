import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';

final themeReducer = combineReducers<ThemeData>(
    [TypedReducer<ThemeData, ChangeAppTheme>(_setAppTheme)]);

ThemeData _setAppTheme(ThemeData theme, ChangeAppTheme action) => action.themeData;


