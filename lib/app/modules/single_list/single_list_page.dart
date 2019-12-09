import 'package:flutter/material.dart';
import 'package:shopping_list/app/modules/home/home_bloc.dart';
import 'package:shopping_list/app/modules/home/home_module.dart';
import 'package:shopping_list/app/shared/models/list_item.dart';

class SingleListPage extends StatefulWidget {
  final String title;
  const SingleListPage({Key key, this.title = "SingleList"}) : super(key: key);

  @override
  _SingleListPageState createState() => _SingleListPageState();
}

class _SingleListPageState extends State<SingleListPage> {
  final selectedList = HomeModule.to.bloc<HomeBloc>().selectedList;

  @override
  Widget build(BuildContext context) {
    // selectedList.items.add(ListItem(description: "Teste de item"));
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedList.name),
      ),
      body: ListView.separated(
        itemCount: selectedList.items.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(selectedList.items[index].description),
            trailing: Checkbox(
              value: selectedList.items[index].checked,
              onChanged: (bool value) {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
