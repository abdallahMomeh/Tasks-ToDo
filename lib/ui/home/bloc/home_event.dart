
import 'package:equatable/equatable.dart';
import 'package:test_ecommerce1/model/source/db/impl/my_database.dart';


class HomeEvent extends Equatable{

   HomeEvent();

  @override
  List<Object> get props => [];

}

class LoadTodoList extends HomeEvent{
}

class UpdateTodoList extends HomeEvent{

   List<Todo> todos;

   UpdateTodoList({this.todos});

}


