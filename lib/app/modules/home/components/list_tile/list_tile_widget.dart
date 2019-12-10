import 'package:flutter/material.dart';

import '../../../../shared/models/shopping_list.dart';
import '../../../single_list/single_list_module.dart';
import '../../home_bloc.dart';

class ListTileWidget extends StatelessWidget {
  final ShoppingList item;
  final HomeBloc controller;
  
  ListTileWidget({this.item, this.controller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(
          "${item.creationDate.toString()} - Total de itens: ${item.items.length}"),
      trailing: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {
          print("menu pressionado");
        },
      ),
      onTap: () {
        controller.selectedList = item;
        print(controller.selectedList.name);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SingleListModule()));
      },
    );
  }
}
