import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/ui/views/login/login_view.dart';

void main() {
  setUpAll(() => setupLocator());
  tearDownAll(() => locator.reset());

  testGoldens('HomeView - default state', (tester) async {
    await loadAppFonts();

    // Set device pixel ratio and size
    await tester.binding.setSurfaceSize(const Size(393, 852));
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(size: Size(393, 852), devicePixelRatio: 1.0),
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: LoginView()),
      ),
    );

    await screenMatchesGolden(tester, 'home_view_default');
  });
}
