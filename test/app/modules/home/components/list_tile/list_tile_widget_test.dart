import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shopping_list/app/modules/home/components/list_tile/list_tile_widget.dart';

main() {
  testWidgets('ListTileWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ListTileWidget()));
    final textFinder = find.text('ListTile');
    expect(textFinder, findsOneWidget);
  });
}
