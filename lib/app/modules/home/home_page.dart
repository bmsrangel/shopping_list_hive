import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/home/components/add_box/add_box_widget.dart';
import 'package:shopping_list/app/modules/home/components/list_tile/list_tile_widget.dart';
import 'package:shopping_list/app/modules/home/home_module.dart';
import 'package:shopping_list/app/modules/single_list/single_list_module.dart';
import 'package:shopping_list/app/shared/models/shopping_list.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Listas de Compras"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeModule.to.bloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .03),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.clearAll();
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: controller.output,
        builder: (BuildContext context, AsyncSnapshot<List<ShoppingList>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: snapshot.data.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              ShoppingList item = snapshot.data[index];
              return Dismissible(
                  key: Key(item.name),
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
                                  controller.deleteShoppingList(snapshot.data[index]);
                                  Navigator.pop(context);
                                  result = Future.value(true);
                                },
                              ),
                            ],
                          );
                        });
                    return result;
                  },
                  child: ListTileWidget(
                    item: item,
                    controller: controller,
                  ));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddBoxWidget();
              });
        },
      ),
    );
  }
}
