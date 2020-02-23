
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_bloc.dart';
import 'package:test_ecommerce1/ui/login/bloc/login_bloc.dart';
import 'package:test_ecommerce1/ui/login/bloc/login_event.dart';
import 'package:test_ecommerce1/ui/login/bloc/login_state.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();

}

class _LoginFormState extends State<LoginForm>{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _usernameController.text= "abdo@gmail.com";
    _passwordController.text = "123456";

    return
         BlocBuilder<LoginBloc, LoginState>(
          builder: (context , state){
            return Form(
              child: Column(

                children: <Widget>[

                  TextFormField(
                    decoration: InputDecoration(labelText: 'username'),
                    controller: _usernameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  RaisedButton(
                    onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
                    child: Text('Login'),
                  ),
                  Container(
                    child: state is LoginLoading ? CircularProgressIndicator() : null,
                  ),
                ],
              ),
            );
          },
        );


  }

  _onLoginButtonPressed() {
    debugPrint("_onLoginButtonPressed");

    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        email: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }


}