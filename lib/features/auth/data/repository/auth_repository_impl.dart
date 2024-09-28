import 'package:flutter_clean_arch/core/error/Failure.dart';
import 'package:flutter_clean_arch/features/auth/data/auth_remote_db.dart';
import 'package:flutter_clean_arch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataStore remoteDataStore;
  AuthRepositoryImpl(this.remoteDataStore);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({required String email, required String password}) async {
    try{
      final id = await remoteDataStore.signInWithEmailAndPassword(email: email, password: password);
      return right(id);
    }catch(e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signUpNewUser({required String name, required String email, required String password}) async {
    try{
      final id = await remoteDataStore.signUpUserWithEmailAndPassword(name: name,email: email, password: password);
      return right(id);
    }catch(e){
      return left(Failure(e.toString()));
    }
  }

}