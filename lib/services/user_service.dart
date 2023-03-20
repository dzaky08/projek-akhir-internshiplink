import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final String table = 'users';

  Future getUsers() async {
    try {
      List<Map<String, dynamic>> users = await _supabase.from(table).select();
      //.select();
      return users;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  Future insertUsers({required Map<String, dynamic> data}) async {
    try {
      await _supabase.from(table).insert(data).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updateUsers({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    try {
      List result = await _supabase.from(table).update(data).match({
        'id': id,
      }).select();
      return result[0];
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future destroyUsers({required int id}) async {
    try {
      await _supabase.from(table).delete().match({'id': id});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
