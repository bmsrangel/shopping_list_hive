import 'package:flutter/material.dart';

import '../../../../shared/models/list_item.dart';
import '../../single_list_bloc.dart';
import '../../single_list_module.dart';

class AddItemWidget extends StatelessWidget {
  final bloc = SingleListModule.to.bloc<SingleListBloc>();

  @override
  Widget build(BuildContext context) {
    TextEditingController newListItem = TextEditingController();
    return AlertDialog(
      title: Text("Adicionar nova lista"),
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
          child: Text("Criar"),
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
