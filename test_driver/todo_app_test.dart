import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  group("Todo App", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) driver.close();
    });

    final _statsTabFinder = find.byValueKey('__statsTab__');
    final _statsTextFinder = find.byValueKey('Stats text');

    test("should show message when tap Stats", () async {
      await driver.tap(_statsTabFinder);

      expect(await driver.getText(_statsTextFinder), "Stats Page");
    });
  });
}
