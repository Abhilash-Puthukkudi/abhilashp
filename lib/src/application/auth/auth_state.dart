part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status loginStatus, logoutStatus;
  final LoginModel loginModel;

  const AuthState({
    this.logoutStatus = const StatusInitial(),
    this.loginModel = const LoginModel(),
    this.loginStatus = const StatusInitial(),
  });

  @override
  List<Object> get props => [loginStatus, loginModel, logoutStatus];

  AuthState copyWith({Status? loginStatus, Status? logoutStatus, LoginModel? loginModel}) {
    return AuthState(logoutStatus: logoutStatus ?? this.logoutStatus, loginStatus: loginStatus ?? this.loginStatus, loginModel: loginModel ?? this.loginModel);
  }
}
