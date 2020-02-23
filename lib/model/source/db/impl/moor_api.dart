

import 'my_database.dart';

class MoorApi{


  static MyDatabase myDatabase;

  static MyDatabase getInstance(){
    if(myDatabase == null){
      print("create database");
      myDatabase = new MyDatabase();
    }
    return myDatabase;
  }



}