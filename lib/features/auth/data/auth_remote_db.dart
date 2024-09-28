import 'package:flutter_clean_arch/core/error/Failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataStore {
  Future<String> signUpUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataStoreImpl extends AuthRemoteDataStore {
  final SupabaseClient supabaseClient;

  AuthRemoteDataStoreImpl(this.supabaseClient);

  @override
  Future<String> signUpUserWithEmailAndPassword(
      {required String name, required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(
          password: password, email: email,
          data: {
            'name': name
          });
      if (response.user == null) {
        throw Exception('user is null');
      }
      return response.user!.id;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
          password: password, email: email);

      if(response.user == null){
        throw Exception('user not created');
      }
      return response.user!.id;
    } catch (e) {
      throw Exception('cant sign in user');
    }
    throw 'null';
  }

}
