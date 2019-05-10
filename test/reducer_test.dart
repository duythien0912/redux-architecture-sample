import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:redux_architecture_sample/src/actions/actions.dart';
import 'package:redux_architecture_sample/src/models/models.dart';
import 'package:redux_architecture_sample/src/reducers/reducers.dart';

main() {
  group("State reducer", () {
    test("should update the AppTab", () {
      final store = Store<AppState>(
          appReducer,
          initialState: AppState(activeTab: AppTab.todos),
      );

      store.dispatch(UpdateTabAction(AppTab.stats));
      expect(store.state.activeTab, AppTab.stats);
    });
  });
}
