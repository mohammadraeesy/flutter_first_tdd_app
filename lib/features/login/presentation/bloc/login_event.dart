part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoginBtnPreesEvent extends LoginEvent{
  final String username;
  final String password;
  LoginBtnPreesEvent({@required this.username,@required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [username,password];
}

