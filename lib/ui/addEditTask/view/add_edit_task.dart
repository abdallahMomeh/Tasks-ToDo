
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_event.dart';
import 'package:test_ecommerce1/model/source/db/impl/moor_api.dart';
import 'package:test_ecommerce1/model/source/db/impl/my_database.dart';
import 'package:test_ecommerce1/ui/addEditTask/view/test_view.dart';
import 'package:test_ecommerce1/ui/home/bloc/home_bloc.dart';
import 'package:test_ecommerce1/ui/home/bloc/home_event.dart';
import 'package:test_ecommerce1/ui/home/view/home_screen.dart';


class AddEditTask extends StatefulWidget{
  @override
  _StateAddEditTask createState() => _StateAddEditTask();



}


class _StateAddEditTask extends State<AddEditTask> {

  final _titleTaskController = TextEditingController();
  final _contentTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build add task");
    return Scaffold(
        appBar: AppBar(
          title: Text("Add-Edit Task"),
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(

            children: <Widget>[



              TextFormField(
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleTaskController,
              ),



              TextFormField(
                decoration: InputDecoration(labelText: "Content"),
                controller: _contentTaskController,
              ),


              RaisedButton(
                onPressed: () {
                  saveTask(context);
                },
                child: Text('add/edit'),
              ),


              Container(
                  child: /*state is LoginLoading ? */CircularProgressIndicator() //: null,
              ),

            ],
          ),
        )

    );


  }

  saveTask(BuildContext context) async {

    if (_titleTaskController.text.isNotEmpty && _contentTaskController.text.isNotEmpty) {

      await MoorApi.getInstance().todosDao.addTodo(
          Todo(title: _titleTaskController.text,
              content: _contentTaskController.text)
      );
      Navigator.pop(context);
    }


  }




}