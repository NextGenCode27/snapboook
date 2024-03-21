import 'package:snapbook/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class HomeRemoteDatasource {
  Future<dynamic> currentUserLogOut();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final SupabaseClient supabaseClient;
  HomeRemoteDatasourceImpl(this.supabaseClient);
  @override
  Future<dynamic> currentUserLogOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
