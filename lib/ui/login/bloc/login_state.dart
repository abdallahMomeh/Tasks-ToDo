
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_ecommerce1/model/data/user.dart';

class LoginState extends Equatable{

  const LoginState();

  @override
  List<Object> get props => null;

}


class LoginInitial extends LoginState{
}

class LoginLoading extends LoginState{

}

class LoginSucess extends LoginState{

  final User user;
  const LoginSucess({this.user});

}



class LoginFailure extends LoginState{
  final String error;

  const LoginFailure({@required  this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';


}


