import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shopping_list/app/shared/models/shopping_list.dart';
import 'package:shopping_list/app/shared/services/localstorage_service.dart';

import '../../shared/models/shopping_list.dart';

class HomeBloc extends BlocBase {
  final LocalstorageService localStorage;
  HomeBloc(this.localStorage) {
    _init();
  }

  BehaviorSubject<List<ShoppingList>> allList =
      BehaviorSubject<List<ShoppingList>>();
  Sink<List<ShoppingList>> get input => allList.sink;
  Stream<List<ShoppingList>> get output => allList.stream;

  List<ShoppingList> shoppingList = [];
  ShoppingList selectedList;

  _init() async {
    final fullList = await localStorage.getAll();
    shoppingList.addAll(fullList);
    allList.sink.add(shoppingList.reversed.toList());
  }

  addShoppingList(ShoppingList newItem) async {
    newItem = await localStorage.addShoppingList(newItem);
    shoppingList.add(newItem);
    allList.sink.add(shoppingList.reversed.toList());
  }

  deleteShoppingList(ShoppingList list) async {
    int index = shoppingList.indexWhere((item) => item.id == list.id);
    shoppingList.removeWhere((item) => item.id == list.id);
    localStorage.deleteShoppingList(index);
    allList.sink.add(shoppingList.reversed.toList());
  }

  clearAll() async {
    await localStorage.clearAll();
    shoppingList.clear();
    allList.sink.add(shoppingList.reversed.toList());
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
    allList.close();
  }
}
