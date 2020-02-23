

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_event.dart';
import 'package:test_ecommerce1/bloc/authentication/authentication_state.dart';
import 'package:test_ecommerce1/model/repo/user_repository.dart';
import 'package:test_ecommerce1/model/source/preferences/shared_manger.dart';
import 'package:test_ecommerce1/util/constants.dart';

class AuthenticationBloc extends Bloc<AuthentucationEvent,AuthenticationState>{

  UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthentucationEvent event) async* {

    print("mapEventToState");

    if( event is AppStarted ){
      print("app started");
      yield* _mapAppStartedToState();
    }

    if( event is LoggedIn ){
      print("LoggedIn");
      yield* _mapLoggedInToState();
    }

    if( event is LoggedOut ){
      print("LoggedOut");
      yield* _mapLoggedOutToState();
    }

  }

  Stream<AuthenticationState> _mapAppStartedToState() async*{

    try {
      bool isSignedIn ;
      await SharedManger.newInstance().then((prefs){
        isSignedIn = prefs.getBool(Constants.loggined);
        if(isSignedIn == null)
          isSignedIn = false;
      });
      print("isSignedIn $isSignedIn");
      if (isSignedIn) {
        print(isSignedIn);

        String username =  await _userRepository.getUser();
        yield Authenticated(name: username);
      } else {
        print("not signed in");
        yield UnAuthenticated();
      }
    } catch (_) {
      print(_.toString());
      //yield UnAuthenticated();
    }

  }


  Stream<AuthenticationState> _mapLoggedInToState() async* {
      String name =  await _userRepository.getUser();
      print(name);
      yield Authenticated(name: name);
  }


  Stream<AuthenticationState> _mapLoggedOutToState() async*{
    yield UnAuthenticated();
  }


}

