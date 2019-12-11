import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/single_list/components/add_item/add_item_widget.dart';
import 'package:shopping_list/app/shared/models/list_item.dart';

import '../../shared/models/list_item.dart';
import 'single_list_bloc.dart';
import 'single_list_module.dart';

class SingleListPage extends StatefulWidget {
  final String title;
  const SingleListPage({Key key, this.title = "SingleList"}) : super(key: key);

  @override
  _SingleListPageState createState() => _SingleListPageState();
}

class _SingleListPageState extends State<SingleListPage> {
  final bloc = SingleListModule.to.bloc<SingleListBloc>();

  @override
  Widget build(BuildContext context) {
    // selectedList.items.add(ListItem(description: "Teste de item"));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bloc.selectedList.name,
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .03),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<ListItem>>(
          stream: bloc.outItems,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return ListView.separated(
              itemCount: snapshot.data.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                ListItem listItem = snapshot.data[index];
                return Dismissible(
                  child: ListTile(
                    title: Text(
                      listItem.description,
                      style: TextStyle(
                          fontSize: 18,
                          decoration: listItem.checked ? TextDecoration.lineThrough : null,
                          color: listItem.checked ? Colors.grey : Colors.black),
                    ),
                    trailing: Checkbox(
                      value: listItem.checked,
                      onChanged: (bool value) {
                        bloc.changeCheckStatus(listItem, value);
                      },
                    ),
                  ),
                  key: Key(listItem.description),
                  background: Container(
                    padding: EdgeInsets.only(right: 20),
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) {
                    Future<bool> result = Future.value(false);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Deseja remover o item da lista?"),
                            content: Text("Esta ação é irreversível!"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Cancelar"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              FlatButton(
                                child: Text("Confirmar"),
                                onPressed: () {
                                  bloc.deleteListItem(index);
                                  Navigator.pop(context);
                                  result = Future.value(true);
                                },
                              ),
                            ],
                          );
                        });
                    return result;
                  },
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: ((context) => AddItemWidget()));
        },
      ),
    );
  }
}
