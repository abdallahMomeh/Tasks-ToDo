

import 'package:flutter/material.dart';
import 'package:test_ecommerce1/model/source/db/impl/my_database.dart';

class TodosListView extends StatelessWidget {
  List<Todo> todos;
  TodosListView({this.todos});


  @override
  Widget build(BuildContext context) {
    print("build listview ${todos.length}");

    return ListView.builder(
      itemBuilder: (context,i){

        return ListTile(
          leading: Icon(Icons.info),
          title: Text(todos[i].title),
          subtitle: Text(todos[i].content),
        );
      }, itemCount: todos.length,);
  }

}
