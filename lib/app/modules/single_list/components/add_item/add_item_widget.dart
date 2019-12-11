import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/single_list/single_list_bloc.dart';
import 'package:shopping_list/app/modules/single_list/single_list_module.dart';
import 'package:shopping_list/app/shared/models/list_item.dart';

class AddItemWidget extends StatelessWidget {
  final bloc = SingleListModule.to.bloc<SingleListBloc>();

  @override
  Widget build(BuildContext context) {
    TextEditingController newListItem = TextEditingController();
    return AlertDialog(
      title: Text("Adicionar item"),
      content: TextField(
        controller: newListItem,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "Novo item",
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Adicionar"),
          onPressed: () {
            ListItem newItem = ListItem(description: newListItem.text);
            bloc.addShoppingItem(newItem);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
