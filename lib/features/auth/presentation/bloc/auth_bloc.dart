import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/error/Failure.dart';
import 'package:flutter_clean_arch/features/auth/domain/usecases/user_sign_up.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/user_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp signUp;
  final UserSignIn signIn;
  AuthBloc({required this.signUp , required this.signIn}) : super(AuthInitial()) {
    on<SignUp>((event, emit) async {
      final res = await signUp(
        UserSignUpParams(
          event.name,
          event.email,
          event.password,
        )
      );
      return res.fold(
              (l) => emit(AuthFailure(l.msg)),
              (r) => emit(AuthSuccess(r))
      );
    },);

    on<SignIn>((event, emit) async {
      final res = await signIn(
          UserSignInParams(
            event.email,
            event.password
          )
      );
      return res.fold(
              (l) => emit(AuthFailure(l.msg)),
              (r) => emit(AuthSuccess(r))
      );
    },);
  }
}
