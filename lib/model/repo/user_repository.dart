

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_ecommerce1/model/data/user.dart';
import 'package:test_ecommerce1/model/source/preferences/shared_manger.dart';
import 'package:test_ecommerce1/util/constants.dart';

class UserRepository{

  String Url = "https://parse.abdullah-app.com/";

  final http.Client httpClient = http.Client();



  Future<bool> signin(String username , String password) async {

    //User user = new User(password: password,username: username);
    final response = await http.Client().post(Url+"area_login",body:{"username":username ,"password":password});
    if (response.statusCode == 200) {

      final data = json.decode(response.body) ;//as List;

      var user = User.fromjson(data["model"]);
      print("signin data: $data");
      print(user.name);
      await SharedManger.newInstance().then((prefs){
        prefs.setString(Constants.Username, user.name);
        prefs.setBool(Constants.loggined, true);
      });
      return true;

    } else {
      return false;
      throw Exception('error fetching posts');
    }

    return SharedManger.getInstance().addBool(Constants.loggined, true);
  }

  Future<bool> isSignedIn() {
     SharedManger.getInstance().getBool(Constants.loggined).then((b){
      return b;
    });
  }

  Future<String> getUser() async {
    String x="";
    await SharedManger.newInstance().then((prefs){
       x = prefs.getString(Constants.Username);
    });
    return x;
  }

  signout() async {
    await SharedManger.newInstance().then((prefs){
      prefs.setBool(Constants.loggined, false);
      prefs.setString(Constants.Username, "");
    }); //.addBool(Constants.loggined, false);
  }


  Future<int> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return 1;/* data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();*/
    } else {
      throw Exception('error fetching posts');
    }
  }

}