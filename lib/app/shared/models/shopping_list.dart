import 'dart:convert';

import 'package:shopping_list/app/shared/models/list_item.dart';

class ShoppingList {
  int id;
  String name;
  String creationDate;
  List<ListItem> items;

  ShoppingList({this.id, this.name, this.creationDate, this.items});

  factory ShoppingList.fromJson(Map json) {
    return ShoppingList(
      id: json["id"],
      name: json["name"],
      creationDate: json["creationDate"],
      items: jsonDecode(json["items"]).map<ListItem>((item) => ListItem.fromJson(item)).toList(),
    );
  }

  toJson() {
    return {
      "id": id,
      "name": name,
      "creationDate": creationDate,
      "items": jsonEncode(items),
    };
  }
}
