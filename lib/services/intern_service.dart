import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InternService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final String table = 'interns';

  Future getInterns() async {
    try {
      List<Map<String, dynamic>> interns = await _supabase.from(table).select(
          '''*, user:userID(*), generation:generationID(*), supervisor:supervisorID(*)''');
      //.select();
      return interns;
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
    required int userID,
    required Map<String, dynamic> data,
  }) async {
    try {
      List result = await _supabase.from(table).update(data).match({
        'userID': userID,
      }).select();
      return result[0];
    } catch (e) {
      debugPrint(e.toString());
      return null;
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
