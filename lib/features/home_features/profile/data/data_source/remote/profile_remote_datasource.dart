import 'package:snapbook/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProfileRemoteDataSource {
  Future<String> updateBio({required String bio});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient supabaseClient;
  ProfileRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> updateBio({required String bio}) async {
    try {
      await supabaseClient.from('profiles').update({'bio': bio}).match(
          {'id': supabaseClient.auth.currentUser?.id});
      return bio;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
