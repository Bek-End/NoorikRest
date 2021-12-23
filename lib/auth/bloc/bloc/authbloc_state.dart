part of 'authbloc_bloc.dart';

@immutable
abstract class AuthblocState {}

class AuthblocInitial extends AuthblocState {}

class AuthblocMainState extends AuthblocState {
  final bool noInternet;
  final bool serverError;
  final bool ok;
  final String token;
  AuthblocMainState({
    required this.noInternet,
    required this.serverError,
    required this.ok,
    required this.token,
  });
}
