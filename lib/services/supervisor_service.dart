import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupervisorService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final String table = 'supervisors';

  Future<List<Map<String, dynamic>>?> getSupervisors() async {
    try {
      List<Map<String, dynamic>> supervisors = await _supabase
          .from(table)
          .select('''*, user:userID(*), interns:interns(*, user:users(*))''');
      //.select();
      return supervisors;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future insertSupervisor({required Map<String, dynamic> data}) async {
    try {
      await _supabase.from(table).insert(data).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updateSupervisor({
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

  Future destroySupervisor({required int id}) async {
    try {
      await _supabase.from(table).delete().match({'id': id});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
