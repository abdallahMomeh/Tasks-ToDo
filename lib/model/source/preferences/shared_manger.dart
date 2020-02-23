
import 'package:shared_preferences/shared_preferences.dart';

class SharedManger{

  static SharedPreferences prefs;

  static SharedManger instance;

  SharedManger(){
    init();
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static SharedManger  getInstance(){

    if(instance == null){
      instance = new SharedManger();
    }
    return instance;
  }

  static Future<SharedPreferences>  newInstance() async {
    //SharedPreferences preferences ;
    if(prefs == null) {
      print("new instance from shared manger");
      prefs = await SharedPreferences.getInstance();
    }
    return prefs;
  }


  Future<bool> addStringToSF(String key , String value){
    newInstance().then((prefs){
      return prefs.setString(key, value);
    });

  }

  getString(String key){
    newInstance().then((prefs){
      return prefs.getString(key);
    });
  }

  /////

  addInt(String key , int value){
    newInstance().then((pres){
      prefs.setInt(key, value);
    });
  }

  getInt(String key){
    newInstance().then((prefs){
      return prefs.getInt(key);
    });
  }

  /////

  addBool(String key , bool value){
    newInstance().then((prefs){
      prefs.setBool(key, value);
    });
  }

  Future<bool> getBool(String key)async {
    newInstance().then((prefs){
      return prefs.getBool(key);
    });
  }




}