import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shopping_list/app/modules/single_list/components/add_item/add_item_widget.dart';

main() {
  testWidgets('AddItemWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AddItemWidget()));
    final textFinder = find.text('AddItem');
    expect(textFinder, findsOneWidget);
  });
}
