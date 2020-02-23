

import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable{

  @override
  List<Object> get props => [];

}


class Uninitialized extends AuthenticationState{}


class Authenticated extends AuthenticationState{

  String name;
  Authenticated({this.name});

  @override
  List<Object> get props => [name];

}


class UnAuthenticated extends AuthenticationState{}