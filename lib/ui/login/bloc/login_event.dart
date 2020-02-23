
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class LoginEvent extends Equatable{

  const LoginEvent();

  @override
  List<Object> get props => [];

}

class LoginButtonPressed extends LoginEvent{

  final String email;
  final String password;

  const LoginButtonPressed({
    @required this.email,
    @required this.password,
  });


}