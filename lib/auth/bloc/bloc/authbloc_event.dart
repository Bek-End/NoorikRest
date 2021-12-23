part of 'authbloc_bloc.dart';

@immutable
abstract class AuthblocEvent {}

class AuthBlocRegisterEvent extends AuthblocEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String repeatPassword;
  AuthBlocRegisterEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.repeatPassword,
  });
}
