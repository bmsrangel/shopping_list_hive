import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shopping_list/app/modules/home/components/add_box/add_box_widget.dart';

main() {
  testWidgets('AddBoxWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AddBoxWidget()));
    final textFinder = find.text('AddBox');
    expect(textFinder, findsOneWidget);
  });
}
