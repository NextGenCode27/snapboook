import 'package:snapbook/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<String> signIn({
    required String email,
    required String password,
  });
  Future<String> signUp({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String photoUrl,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl(this.supabaseClient);
  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw const ServerException(message: 'User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<String> signUp({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String photoUrl,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'userName': userName,
          'phone': phone,
          'photoUrl': photoUrl,
        },
      );
      if (response.user == null) {
        throw const ServerException(message: 'User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
