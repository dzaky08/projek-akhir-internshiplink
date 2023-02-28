import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InternService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final String table = 'interns';

  Future getInterns() async {
    try {
      List<Map<String, dynamic>> supervisors = await _supabase
          .from(table)
          // .select('''*, user:users(*), generation:generations(*), supervisor:supervisors(*)''')
          .select();
      return supervisors;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  Future insertIntern({required Map<String, dynamic> data}) async {
    try {
      await _supabase.from(table).insert(data).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updateIntern({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _supabase.from(table).update(data).match({
        'id': id,
      }).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future destroyIntern({required int id}) async {
    try {
      await _supabase.from(table).delete().match({'id': id});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
