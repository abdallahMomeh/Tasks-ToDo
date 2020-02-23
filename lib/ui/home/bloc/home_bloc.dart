
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ecommerce1/model/source/db/impl/moor_api.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{

  StreamSubscription _todoStream;

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

    if(event is LoadTodoList){
      yield* _mapLoadListToState();
    }
    if(event is UpdateTodoList){
      yield* _mapUpdateTodoListToState(event);
    }


  }

  Stream<HomeState> _mapLoadListToState() async* {

    _todoStream?.cancel();
    _todoStream = MoorApi.getInstance().todosDao.watchAllTodos.listen(
            (todos) {
          return add(UpdateTodoList(todos: todos));
        }
    );

  }

  Stream<HomeState> _mapUpdateTodoListToState(UpdateTodoList event) async*{

    if(state is UpdateViewTodoList)
      yield UpdateViewTodoList22(todos: event.todos);
    else
      yield UpdateViewTodoList(todos: event.todos);

  }


  @override
  Future<void> close() {
    print("colse");
    _todoStream?.cancel();
    return super.close();
  }

  //reload
}