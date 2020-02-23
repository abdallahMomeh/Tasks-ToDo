

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_bloc.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_event.dart';
import 'package:test_ecommerce1/model/repo/user_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{

  UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc( { @required this.authenticationBloc,@required  this.userRepository});

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    if(event is LoginButtonPressed){
      yield* _mapLoginWithCredentialsPressedToState( email: event.email ,password: event.password );
    }

  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({String email, String password,}) async* {

    yield LoginLoading();

    try {
      bool suceess = await userRepository.signin(email, password);
      print(suceess);
      if(suceess){
        authenticationBloc.add(LoggedIn());
        yield LoginSucess();
      }else
        yield LoginFailure();
    }catch (_) {
      print(_.toString());
      yield LoginFailure();
    }

  }


}
