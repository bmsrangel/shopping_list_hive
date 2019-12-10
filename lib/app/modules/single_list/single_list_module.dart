import 'package:shopping_list/app/modules/single_list/single_list_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/single_list/single_list_page.dart';

import '../../app_module.dart';
import '../../shared/services/localstorage_service.dart';
import '../home/home_bloc.dart';
import '../home/home_module.dart';

class SingleListModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SingleListBloc(HomeModule.to.bloc<HomeBloc>().selectedList,
            AppModule.to.get<LocalstorageService>())),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SingleListPage();

  static Inject get to => Inject<SingleListModule>.of();
}
