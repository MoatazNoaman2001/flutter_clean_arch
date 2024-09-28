import 'package:flutter_clean_arch/core/error/Failure.dart';
import 'package:flutter_clean_arch/core/useCases/usecase.dart';
import 'package:flutter_clean_arch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignIn implements UseCase<String, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignInParams params) async {
    return await authRepository.loginWithEmailPassword(email: params.email, password: params.password);
  }

}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams(this.email, this.password);

}