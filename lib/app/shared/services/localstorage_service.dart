import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shopping_list/app/shared/models/shopping_list.dart';

import '../models/shopping_list.dart';

class LocalstorageService extends Disposable {
  Completer<Box> completer = Completer<Box>();
  LocalstorageService() {
    _initDb();
  }

  _initDb() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = Hive.openBox("shoppingLists");
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<List<ShoppingList>> getAll() async {
    final box = await completer.future;
    return box.values.map((item) => ShoppingList.fromJson(item)).toList();
  }

  Future<ShoppingList> addShoppingList(ShoppingList item) async {
    final box = await completer.future;
    item.id = box.values.length;
    box.put(box.values.length, item.toJson());
    return item;
  }

  Future<ShoppingList> updateShoppingList(ShoppingList list) async {
    final box = await completer.future;
    box.putAt(list.id, list.toJson());
    return list;
  }

  void deleteShoppingList(int index) async {
    final box = await completer.future;
    box.deleteAt(index);
  }

  clearAll() async {
    final box = await completer.future;
    await box.clear();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
