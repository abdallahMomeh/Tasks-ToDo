import 'package:flutter/material.dart';
import 'package:test_ecommerce1/model/source/db/impl/my_database.dart';

class TodosGridList extends StatelessWidget {
  List<Todo> todos;
  TodosGridList({this.todos});


  @override
  Widget build(BuildContext context) {
    print("build listview ${todos.length}");

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.info),
            title: Text(todos[i].title),
            subtitle: Text(todos[i].content),
          );
        },itemCount:todos.length ,); /*ListView.builder(
      itemBuilder: (context,i){

        return ListTile(
          leading: Icon(Icons.info),
          title: Text(todos[i].title),
          subtitle: Text(todos[i].content),
        );
      }, itemCount: todos.length,);*/
  }

}
