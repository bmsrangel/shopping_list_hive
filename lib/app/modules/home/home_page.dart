import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/home/components/add_box/add_box_widget.dart';
import 'package:shopping_list/app/modules/home/home_module.dart';
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
        title: Text(widget.title),
        centerTitle: true,
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
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.creationDate.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    print("menu pressionado");
                  },
                ),
                onTap: () {
                  controller.selectedList = item;
                  print(controller.selectedList.name);
                },
              );
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
