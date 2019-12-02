import 'package:shopping_list/app/shared/models/list_item.dart';

class ShoppingList {
  String name;
  String creationDate;
  List<ListItem> items;

  ShoppingList({this.name, this.creationDate, this.items});

  factory ShoppingList.fromJson(Map json) {
    return ShoppingList(
      name: json["name"],
      creationDate: json["creationDate"],
      items: json["items"].map((item) => ListItem.fromJson(item)).toList(),
    );
  }

  toJson() {
    return {
      "name": name,
      "creationDate": creationDate,
      "items": items.toString,
    };
  }
}
