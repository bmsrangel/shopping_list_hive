import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:shopping_list/app/modules/single_list/single_list_bloc.dart';
import 'package:shopping_list/app/modules/single_list/single_list_module.dart';

void main() {
  initModule(SingleListModule());
  SingleListBloc bloc;

  setUp(() {
    bloc = SingleListModule.to.bloc<SingleListBloc>();
  });

  group('SingleListBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<SingleListBloc>());
    });
  });
}
