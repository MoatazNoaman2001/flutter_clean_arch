part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class SignUp extends AuthEvent{
  final String name;
  final String email;
  final String password;

  SignUp(this.name, this.email, this.password);
}
class SignIn extends AuthEvent{

  final String email;
  final String password;

  SignIn(this.email, this.password);
}
