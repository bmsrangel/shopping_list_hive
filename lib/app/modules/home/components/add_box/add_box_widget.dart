import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/home/home_bloc.dart';
import 'package:shopping_list/app/modules/home/home_module.dart';
import 'package:shopping_list/app/shared/models/shopping_list.dart';

class AddBoxWidget extends StatelessWidget {
  final TextEditingController newListText = TextEditingController();
  final controller = HomeModule.to.bloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Adicionar nova lista"),
      content: TextField(
        controller: newListText,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "Insira o nome da lista aqui",
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
            DateTime today = DateTime.now().toLocal();
            List dateArray = today.toString().split(" ")[0].split("-");
            String creationDate = dateArray.reversed.join("/");
            ShoppingList newList =
                ShoppingList(creationDate: creationDate, name: newListText.text, items: []);
            controller.addShoppingList(newList);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
