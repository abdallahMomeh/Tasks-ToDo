


import 'package:equatable/equatable.dart';

class AuthentucationEvent extends Equatable{

  @override
  List<Object> get props => [];

}


 class AppStarted extends AuthentucationEvent{}

 class LoggedIn extends AuthentucationEvent{}

 class LoggedOut extends AuthentucationEvent{}
