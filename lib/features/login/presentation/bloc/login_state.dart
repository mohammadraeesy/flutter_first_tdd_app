part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final Login login;
  LoginLoadedState({@required this.login});
  @override
  // TODO: implement props
  List<Object> get props => [login];
}
class ErrorState extends LoginState{
  final String massage;
  ErrorState({@required this.massage});
  @override
  // TODO: implement props
  List<Object> get props => [massage];
}
