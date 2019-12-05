import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shopping_list/app/shared/models/shopping_list.dart';

class LocalstorageService extends Disposable {
  Completer<Box> completer = Completer<Box>();
  LocalstorageService() {
    _initDb();
  }

  _initDb() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final box = Hive.openBox("userToken");
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<List<ShoppingList>> getAll() async {
    final box = await completer.future;
    return box.values.map((item) => ShoppingList.fromJson(item)).toList();
  }

  Future<ShoppingList> addShoppingList(ShoppingList item) async {
    final box = await completer.future;
    box.put(box.values.length, item.toString());
    return item;
  }

  Future<String> getUserToken() async {
    final box = await completer.future;
    String userToken = box.get("token");
    return userToken;
  }

  Future<String> storeUserToken(String userToken) async {
    final box = await completer.future;
    box.put("token", userToken);
    return userToken;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
