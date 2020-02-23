


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_event.dart';
import 'package:test_ecommerce1/model/repo/user_repository.dart';
import 'package:test_ecommerce1/model/source/db/impl/moor_api.dart';
import 'package:test_ecommerce1/model/source/db/impl/my_database.dart';
import 'package:test_ecommerce1/ui/addEditTask/view/add_edit_task.dart';
import 'package:test_ecommerce1/ui/home/bloc/home_bloc.dart';
import 'package:test_ecommerce1/ui/home/bloc/home_event.dart';
import 'package:test_ecommerce1/ui/home/bloc/home_state.dart';
import 'package:test_ecommerce1/ui/home/view/drawer.dart';
import 'package:test_ecommerce1/ui/home/view/todo_grid_listview.dart';
import 'package:test_ecommerce1/ui/home/view/todo_listview.dart';


class HomeScreen extends StatelessWidget{


  String name;
  HomeScreen({this.name});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Home"),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute( builder: (context)=> AddEditTask()));

          },)

        ],

      ),

      drawer: Drawer(
        child: DrawerHome(),
      ),

      body: ContentHomeScreen(),

    );

  }

}


class ContentHomeScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return   BlocBuilder<HomeBloc,HomeState>(

      condition: (p,s){
        if(p==s){
          return false;
        }
        return true;
      },

      builder: (bloc,state){

        if(state is UpdateViewTodoList){
          return /*TodosGridList(todos: state.todos); */TodosListView(todos: state.todos,);
        }

        if(state is UpdateViewTodoList22){
          return /*TodosGridList(todos: state.todos);*/TodosListView(todos: state.todos,);
        }


        return Container( child:  Text("Loading.."),);
      },


    );
  }

}
