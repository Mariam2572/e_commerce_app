part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginErrorState extends LoginState {
  String? errorMessage;
  LoginErrorState({this.errorMessage});
}
final class LoginSuccessState extends LoginState {
  AuthResultEntity authResultEntity;
  LoginSuccessState( {required this.authResultEntity});
}
