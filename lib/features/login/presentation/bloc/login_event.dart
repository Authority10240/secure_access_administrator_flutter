part of 'login_bloc.dart';
 @immutable
abstract class LoginPageEvent extends BaseEvent {}

class SignInClickedEvent extends LoginPageEvent{
  final String username;
  final String password;

  SignInClickedEvent({required this.password, required this.username});
}

class PasswordVisibleEvent extends LoginPageEvent{

}
