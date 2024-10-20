part of 'login_bloc.dart';
@immutable
abstract class LoginPageState extends BaseState {
  bool obscure ;

  LoginPageState({super.errorCode, super.errorMessage,this.obscure = true});
}

class LoginPageInitState extends LoginPageState  {}

class SignInClickedState extends LoginPageState{

  UserCredential? userCredential;
  SignInClickedState({this.userCredential,super.errorCode,super.obscure, super.errorMessage});
}
class PasswordVisibleState extends LoginPageState{

  PasswordVisibleState({super.obscure});
}

