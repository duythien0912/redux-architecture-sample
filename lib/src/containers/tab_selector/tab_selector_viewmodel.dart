import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/models/models.dart';

class TabSelectorVM extends Equatable {
  final AppTab activeTab;
  final Function(int) onTabSelected;

  TabSelectorVM({this.activeTab, this.onTabSelected}) : super([activeTab]);

  static TabSelectorVM fromStore(Store<AppState> store) {
    return TabSelectorVM(
        activeTab: store.state.activeTab,
        onTabSelected: (index) {
          store.dispatch(UpdateTabAction(AppTab.values[index]));
        });
  }
}
