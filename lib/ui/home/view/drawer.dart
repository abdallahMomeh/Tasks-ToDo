

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_event.dart';
import 'package:test_ecommerce1/model/repo/user_repository.dart';


class DrawerHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Abdallah Ahmed"),
              accountEmail: Text("abdallah@gmail.com")),
          ListTile(
             title: Text("Logout"),
             leading: Icon(Icons.exit_to_app),
             onTap: (){
               Navigator.pop(context);
                UserRepository repository = new UserRepository();
                repository.signout();
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                },
            )

        ],
      ),
    );
  }

}