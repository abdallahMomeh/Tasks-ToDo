


class User {

  int id;
  String name;
  int city;
  String username;
  String password;

  User({this.id,this.name,this.username,this.password,this.city});

  factory User.fromjson(Map<String ,dynamic> json){

    return User(
      id: json["id"],
      name: json["name"],
      city: json["city"],
    /*  username: json["username"],
      password: json["password"]*/
    );
  }

  Map toMap(){
    var map = new Map<String,dynamic>();
    map["id"]= id;
    map["name"] = name;
    map["city"] = city;
    map["username"] = username;
    map["password"] = password;

    return map;
  }



}