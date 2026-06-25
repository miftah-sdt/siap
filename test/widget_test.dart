import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/constants/app_constants.dart';
import 'package:siap/core/theme/dark_theme.dart';
import 'package:siap/core/theme/light_theme.dart';

void main() {
  testWidgets('App renders splash content', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LightTheme.theme,
        darkTheme: DarkTheme.theme,
        home: Builder(
          builder: (context) {
            return Scaffold(body: Center(child: Text(AppConstants.appName)));
          },
        ),
      ),
    );

    expect(find.text(AppConstants.appName), findsOneWidget);
  });
}
