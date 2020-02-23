import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_bloc.dart';
import 'package:test_ecommerce1/model/repo/user_repository.dart';
import 'package:test_ecommerce1/ui/addEditTask/view/add_edit_task.dart';
import 'package:test_ecommerce1/ui/home/bloc/home_bloc.dart';
import 'package:test_ecommerce1/ui/home/bloc/home_event.dart';
import 'package:test_ecommerce1/ui/home/view/home_screen.dart';
import 'package:test_ecommerce1/ui/login/view/login_screen.dart';
import 'package:test_ecommerce1/ui/splash/splash_screen.dart';

import 'bloc/authentication/authentication_event.dart';
import 'bloc/authentication/authentication_state.dart';
import 'bloc/others/MoviesListBloc.dart';
import 'model/source/preferences/shared_manger.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedManger.getInstance();

  runApp(
        BlocProvider<AuthenticationBloc>(
          create:   (context){ return  AuthenticationBloc(userRepository: UserRepository())..add(AppStarted());},
          child: MyApp()
            ),
  );

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  App()
    );

  }

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

//    moviesBloc..getMovies();

    return  BlocBuilder<AuthenticationBloc,AuthenticationState>(

      condition: (previousState, state){
        return previousState == Authenticated ? false:true;
      },

      builder: (context,state){

        print("my home app");

        if(state is Uninitialized){
          return SplashScreen();
        }

        if(state is Authenticated){
          print("Authenticated");
          return
            BlocProvider<HomeBloc>(
                create: (context){
                  print("create bloc privder 1");
                  return HomeBloc()..add(LoadTodoList());
                },

                child: HomeScreen(name: state.name,));
        }

        if(state is UnAuthenticated){
          print("UnAuthenticated");
          return LoginScreen();
        }


        print("splash screen");
        return  SplashScreen();

      },
    );

  }

}
