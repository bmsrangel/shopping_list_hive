import 'package:shopping_list/app/modules/single_list/single_list_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/single_list/single_list_page.dart';

class SingleListModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SingleListBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SingleListPage();

  static Inject get to => Inject<SingleListModule>.of();
}
