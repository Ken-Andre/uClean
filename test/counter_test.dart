import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ucleankim/main.dart';

void main() {
  testWidgets('App builds', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
