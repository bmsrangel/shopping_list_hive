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
        title: Text(bloc.selectedList.name),
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
                return ListTile(
                  title: Text(snapshot.data[index].description),
                  trailing: Checkbox(
                    value: snapshot.data[index].checked,
                    onChanged: (bool value) {
                      bloc.changeCheckStatus(snapshot.data[index], value);
                    },
                  ),
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
