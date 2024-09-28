import 'package:fpdart/fpdart.dart';

import '../../../../core/error/Failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpNewUser({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}