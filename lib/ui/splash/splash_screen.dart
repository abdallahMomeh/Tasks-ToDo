


import 'package:flutter/material.dart';
import 'package:test_ecommerce1/model/repo/user_repository.dart';
import 'package:test_ecommerce1/model/source/preferences/shared_manger.dart';
import 'package:test_ecommerce1/util/constants.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

   /* SharedManger.newInstance().then((prefs){
      prefs.setBool(Constants.loggined, false);
    });*/
    //SharedManger.getInstance().addBool(Constants.loggined, false);

     return Scaffold(

        body: Center(
           child: Text('Splash Screen' ),
        ),
     );
  }

  _onPressed(){

    UserRepository repository = new UserRepository();
    repository.signin("abdallah", "password");
  }


}