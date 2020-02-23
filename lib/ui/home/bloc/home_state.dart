
import 'package:equatable/equatable.dart';
import 'package:test_ecommerce1/model/source/db/impl/my_database.dart';



class HomeState extends Equatable{

  HomeState();

  @override
  List<Object> get props => [];

}

class HomeInitial extends HomeState{
}

class UpdateViewTodoList extends HomeState{

  List<Todo> todos;

  UpdateViewTodoList({this.todos});

}

class UpdateViewTodoList22 extends HomeState{

  final List<Todo> todos;

  UpdateViewTodoList22({this.todos});

}