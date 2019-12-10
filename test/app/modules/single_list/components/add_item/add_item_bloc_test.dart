import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:shopping_list/app/modules/single_list/components/add_item/add_item_bloc.dart';
import 'package:shopping_list/app/modules/single_list/single_list_module.dart';

void main() {
  initModule(SingleListModule());
  AddItemBloc bloc;

  setUp(() {
    bloc = SingleListModule.to.bloc<AddItemBloc>();
  });

  group('AddItemBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<AddItemBloc>());
    });
  });
}
