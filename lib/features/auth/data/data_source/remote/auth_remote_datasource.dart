import 'package:snapbook/core/common/models/user_model.dart';
import 'package:snapbook/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });
  Future<UserModel> signUp({
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
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', response.user!.id);
      if (response.user == null) {
        throw const ServerException(message: 'User is null');
      }
      return UserModel.fromJson(userData.first);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<UserModel> signUp({
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
          'name': userName,
          'phone': phone,
          'photo_url': photoUrl,
        },
      );
      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', response.user!.id);
      if (response.user == null) {
        throw const ServerException(message: 'User is null');
      }
      return UserModel.fromJson(userData.first);
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
