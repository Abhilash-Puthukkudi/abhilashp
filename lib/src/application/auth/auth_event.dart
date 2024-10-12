part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final PmLoginModel loginModel;

  LoginEvent({required this.loginModel});
  @override
  List<Object> get props => [loginModel];
}

class LogOutEvent extends AuthEvent {
  LogOutEvent();
  @override
  List<Object> get props => [];
}
