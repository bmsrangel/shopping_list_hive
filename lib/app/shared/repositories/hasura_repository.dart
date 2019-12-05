import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shopping_list/app/app_module.dart';
import 'package:shopping_list/app/shared/models/shopping_list.dart';
import 'package:shopping_list/app/shared/repositories/auth_repository.dart';
import 'package:shopping_list/app/shared/services/localstorage_service.dart';

const String URL = "http://shopping-list-flutter.herokuapp.com/v1/graphql";

class HasuraRepository extends Disposable {
  final String userToken;
  HasuraRepository(this.userToken);

  HasuraConnect connection;

  Future<List<ShoppingList>> getShoppingLists() async {
    String query = """
      query {
        shopping_lists {
          id
          name
          creation_date
        }
      }
    """;

    dynamic data = await connection.query(query);
    List<ShoppingList> shoppingList;
    data["data"]["shopping_lists"].map((list) => shoppingList.add(ShoppingList.fromJson(list)));
    return shoppingList;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
