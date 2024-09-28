import 'package:flutter_clean_arch/core/error/Failure.dart';
import 'package:flutter_clean_arch/core/useCases/usecase.dart';
import 'package:flutter_clean_arch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpNewUser(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams(this.name, this.email, this.password);
}
