

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_bloc.dart';
import 'package:test_ecommerce1/model/repo/user_repository.dart';
import 'package:test_ecommerce1/ui/login/bloc/login_bloc.dart';
import 'package:test_ecommerce1/ui/login/bloc/login_event.dart';
import 'package:test_ecommerce1/ui/login/bloc/login_state.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),

      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository:  UserRepository()
          );
        },
        child: LoginForm(),
      ),
    );
  }



}

