import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import '../../shared/models/list_item.dart';
import '../../shared/models/list_item.dart';
import '../../shared/models/shopping_list.dart';
import '../../shared/services/localstorage_service.dart';

class SingleListBloc extends BlocBase {
  BehaviorSubject<List<ListItem>> shoppingItems = BehaviorSubject<List<ListItem>>();
  Sink<List<ListItem>> get inItems => shoppingItems.sink;
  Stream<List<ListItem>> get outItems => shoppingItems.stream;

  final ShoppingList selectedList;
  final LocalstorageService localStorage;

  SingleListBloc(this.selectedList, this.localStorage) {
    shoppingItems.sink.add(selectedList.items);
  }

  addShoppingItem(ListItem item) async {
    selectedList.items.add(item);
    await localStorage.updateShoppingList(selectedList);
    shoppingItems.sink.add(selectedList.items);
  }

  changeCheckStatus(ListItem listItem, bool check) async {
    selectedList.items[selectedList.items.indexOf(listItem)].checked = check;
    await localStorage.updateShoppingList(selectedList);
    shoppingItems.sink.add(selectedList.items);
  }

  deleteListItem(int index) async {
    selectedList.items.removeAt(index);
    await localStorage.updateShoppingList(selectedList);
    shoppingItems.sink.add(selectedList.items);
  }

  //dispose will be called automatically by closing its streams

  @override
  void dispose() {
    super.dispose();
    shoppingItems.close();
  }
}
