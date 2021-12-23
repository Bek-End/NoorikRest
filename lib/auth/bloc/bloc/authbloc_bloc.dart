import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:noorikapi/auth/data/verify_model.dart';
import 'package:noorikapi/auth/repository/auth_repo.dart';
import 'package:noorikapi/core/exceptions.dart';
part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthblocBloc extends Bloc<AuthblocEvent, AuthblocState> {
  final AuthRepo authRepo;
  AuthblocBloc(
    this.authRepo,
  ) : super(AuthblocInitial()) {
    on<AuthblocEvent>(
      (event, emit) async {
        if (event is AuthBlocRegisterEvent) {
          final AuthBlocRegisterEvent registerEvent = event;
          try {
            final res = await authRepo.verify(
              model: VerifyModel(
                phoneNumber: registerEvent.phone,
                verifyType: VerifyType.sms,
              ),
            );
            emit(
              AuthblocMainState(
                noInternet: false,
                serverError: false,
                ok: true,
                token: res,
              ),
            );
          } on NoInternetException {
            emit(
              AuthblocMainState(
                noInternet: true,
                serverError: false,
                ok: false,
                token: '',
              ),
            );
          } on ServerException {
            emit(
              AuthblocMainState(
                noInternet: false,
                serverError: true,
                ok: false,
                token: '',
              ),
            );
          }
        }
      },
    );
  }
}
